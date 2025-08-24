// Enhanced Variable and Scope Management Implementation
#include "scope.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

// Create scope manager
ScopeManager *create_scope_manager(void) {
    ScopeManager *manager = calloc(1, sizeof(ScopeManager));
    
    // Create global scope
    Scope *global = calloc(1, sizeof(Scope));
    global->type = SCOPE_GLOBAL;
    global->variables = NULL;
    global->parent = NULL;
    global->local_offset = 0;
    global->function_name = NULL;
    
    manager->current_scope = global;
    manager->global_scope = global;
    manager->global_var_count = 0;
    manager->in_global_scope = true;
    
    return manager;
}

// Free scope manager
void free_scope_manager(ScopeManager *manager) {
    if (!manager) return;
    
    // Free all scopes (should only be global at end)
    while (manager->current_scope) {
        exit_scope(manager);
    }
    
    free(manager);
}

// Enter new scope
void enter_scope(ScopeManager *manager, ScopeType type, const char *function_name) {
    if (!manager) return;
    
    Scope *new_scope = calloc(1, sizeof(Scope));
    new_scope->type = type;
    new_scope->variables = NULL;
    new_scope->parent = manager->current_scope;
    new_scope->local_offset = (type == SCOPE_GLOBAL) ? 0 : -8; // Start below base pointer
    new_scope->function_name = function_name ? strdup(function_name) : NULL;
    
    manager->current_scope = new_scope;
    
    // Update global scope tracking
    if (type != SCOPE_GLOBAL) {
        manager->in_global_scope = false;
    }
}

// Exit current scope
void exit_scope(ScopeManager *manager) {
    if (!manager || !manager->current_scope) return;
    
    Scope *old_scope = manager->current_scope;
    manager->current_scope = old_scope->parent;
    
    // Update global scope tracking
    if (manager->current_scope == manager->global_scope) {
        manager->in_global_scope = true;
    }
    
    // Free variables in this scope
    Variable *var = old_scope->variables;
    while (var) {
        Variable *next = var->next;
        free(var->name);
        if (var->has_const_value && var->const_value.str_val) {
            free(var->const_value.str_val);
        }
        free(var);
        var = next;
    }
    
    if (old_scope->function_name) {
        free(old_scope->function_name);
    }
    free(old_scope);
}

// Declare variable in current scope
Variable *declare_variable(ScopeManager *manager, const char *name, SemanticType type, bool is_constant) {
    if (!manager || !manager->current_scope || !name) return NULL;
    
    Scope *scope = manager->current_scope;
    
    // Check for redeclaration in current scope
    Variable *var = scope->variables;
    while (var) {
        if (strcmp(var->name, name) == 0) {
            printf("Error: Variable '%s' already declared in current scope\n", name);
            return NULL;
        }
        var = var->next;
    }
    
    // Create new variable
    Variable *new_var = calloc(1, sizeof(Variable));
    new_var->name = strdup(name);
    new_var->type = type;
    new_var->is_constant = is_constant;
    new_var->is_global = (scope->type == SCOPE_GLOBAL);
    new_var->has_const_value = false;
    
    // Assign stack offset
    if (new_var->is_global) {
        // Global variables get special handling
        new_var->stack_offset = 0; // Will be handled differently
        if (manager->global_var_count < 1000) {
            manager->global_vars[manager->global_var_count++] = new_var;
        }
    } else {
        // Local variables get stack offsets
        new_var->stack_offset = scope->local_offset;
        scope->local_offset -= 8; // 64-bit word size
    }
    
    // Add to scope
    new_var->next = scope->variables;
    scope->variables = new_var;
    
    return new_var;
}

// Lookup variable (search up scope chain)
Variable *lookup_variable(ScopeManager *manager, const char *name) {
    if (!manager || !name) return NULL;
    
    Scope *scope = manager->current_scope;
    while (scope) {
        Variable *var = scope->variables;
        while (var) {
            if (strcmp(var->name, name) == 0) {
                return var;
            }
            var = var->next;
        }
        scope = scope->parent;
    }
    
    return NULL; // Not found
}

// Lookup variable in global scope only (for :: operator)
Variable *lookup_global_variable(ScopeManager *manager, const char *name) {
    if (!manager || !name || !manager->global_scope) return NULL;
    
    Variable *var = manager->global_scope->variables;
    while (var) {
        if (strcmp(var->name, name) == 0) {
            return var;
        }
        var = var->next;
    }
    
    return NULL; // Not found in global scope
}

// Set variable constant value
void set_variable_value(Variable *var, int int_val, float float_val, const char *str_val) {
    if (!var) return;
    
    var->has_const_value = true;
    var->const_value.int_val = int_val;
    var->const_value.float_val = float_val;
    var->const_value.str_val = str_val ? strdup(str_val) : NULL;
}
