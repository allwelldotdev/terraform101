# Creating Pre & Postconditions in Terraform IAC Configuration as Object Validation Techniques

In this exercise, I learned how to validate objects and resources through the use of preconditions, postconditions, and checks in Terraform IAC.

**Precondition** validates information, data, or variable referenced inside a resource configuration.

**Postcondition** validates information from the resource or block itself.

### The Difference between Pre, Postcondition, and Variable Validations

The difference between these and validations in variables is that validations in variables are only capable of referencing the variable itself within it's condition attribute or validation block.
Some times, you may want to reference data from another data source or resource, in that case a precondition block tied to a resource would better serve you.
Then, if you want to check data from a resource itself (usually known after apply) use postcondition.

