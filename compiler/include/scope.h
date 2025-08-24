// Enhanced Variable and Scope Management for ÆLang
#ifndef SCOPE_H
#define SCOPE_H

#include "semantic.h"

// Scope types
typedef enum {
    SCOPE_GLOBAL,
    SCOPE_FUNCTION,
    SCOPE_BLOCK
} ScopeType;

// Variable entry
typedef struct Variable {
    char *name;
    SemanticType type;
    bool is_constant;
    bool is_global;
    int stack_offset;        // For local variables
    union {
        int int_val;         // For constant integers
        float float_val;     // For constant floats
        char *str_val;       // For constant strings
    } const_value;
    bool has_const_value;
    struct Variable *next;
} Variable;

// Scope frame
typedef struct Scope {
    ScopeType type;
    Variable *variables;
    struct Scope *parent;
    int local_offset;        // Current stack offset for this scope
    char *function_name;     // For function scopes
} Scope;

// Scope manager
typedef struct ScopeManager {
    Scope *current_scope;
    Scope *global_scope;
    int global_var_count;
    Variable *global_vars[1000];
    bool in_global_scope;
} ScopeManager;

// Function prototypes
ScopeManager *create_scope_manager(void);
void free_scope_manager(ScopeManager *manager);
void enter_scope(ScopeManager *manager, ScopeType type, const char *function_name);
void exit_scope(ScopeManager *manager);
Variable *declare_variable(ScopeManager *manager, const char *name, SemanticType type, bool is_constant);
Variable *lookup_variable(ScopeManager *manager, const char *name);
Variable *lookup_global_variable(ScopeManager *manager, const char *name);
void set_variable_value(Variable *var, int int_val, float float_val, const char *str_val);

#endif // SCOPE_H
