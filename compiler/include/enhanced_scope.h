// Enhanced Variable and Scope Management for ÆLang
#ifndef ENHANCED_SCOPE_H
#define ENHANCED_SCOPE_H

#include "semantic.h"

// Extended scope types for enhanced management
typedef enum {
    ENHANCED_SCOPE_GLOBAL,
    ENHANCED_SCOPE_FUNCTION,
    ENHANCED_SCOPE_BLOCK
} EnhancedScopeType;

// Enhanced variable entry
typedef struct EnhancedVariable {
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
    struct EnhancedVariable *next;
} EnhancedVariable;

// Enhanced scope frame
typedef struct EnhancedScope {
    EnhancedScopeType type;
    EnhancedVariable *variables;
    struct EnhancedScope *parent;
    int local_offset;        // Current stack offset for this scope
    char *function_name;     // For function scopes
} EnhancedScope;

// Enhanced scope manager
typedef struct EnhancedScopeManager {
    EnhancedScope *current_scope;
    EnhancedScope *global_scope;
    int global_var_count;
    EnhancedVariable *global_vars[1000];
} EnhancedScopeManager;

// Function prototypes
EnhancedScopeManager *create_enhanced_scope_manager(void);
void free_enhanced_scope_manager(EnhancedScopeManager *manager);
void enter_enhanced_scope(EnhancedScopeManager *manager, EnhancedScopeType type, const char *function_name);
void exit_enhanced_scope(EnhancedScopeManager *manager);
EnhancedVariable *declare_enhanced_variable(EnhancedScopeManager *manager, const char *name, SemanticType type, bool is_constant);
EnhancedVariable *lookup_enhanced_variable(EnhancedScopeManager *manager, const char *name);
void set_enhanced_variable_value(EnhancedVariable *var, int int_val, float float_val, const char *str_val);

#endif // ENHANCED_SCOPE_H
