# Creating Pre & Postconditions in Terraform IAC Configuration as Object Validation Techniques

In this exercise, I learned how to validate objects and resources through the use of preconditions, postconditions, and checks in Terraform IAC.

**Precondition** validates information, data, or variable referenced inside a resource configuration.

**Postcondition** validates information from the resource or block itself.

### The Difference between Pre, Postcondition, and Variable Validations

The difference between these and validations in variables is that validations in variables are only capable of referencing the variable itself within it's condition attribute or validation block.
Some times, you may want to reference data from another data source or resource, in that case a precondition block tied to a resource would better serve you.
Then, if you want to check data from a resource itself (usually known after apply) use postcondition.

### An interesting note about Postconditions

Postconditions can also work like preconditions as well, if the value checked is available within the local configuration (in other words, if the value is not known after apply). To make this work, use the `self` object.

Something to note: when you are checking the preconditional validation of a resource type, sometimes it's more valuable to use postconditions to check instead of preconditions. Because postconditions will give you a validation response when you run "terraform plan" if the value already exists inside the Terraform configuration. Except if the value is 'known after apply', in that case still using postconditions will give you the validation response when the resource config is applied.

Therefore, it appears that to cover multiple grounds, postcondition is the better object validation block to use.