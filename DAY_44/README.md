* In Moore machine, the outputs depend on states only, therefore it is ‘synchronous machine’ and the output is available after 1 clock cycle.

* Whereas,in Mealy machine the output depends on states and external inputs and the output is available as soon as the input is changed therefore it is ‘asynchronous machine’

* Mealy machine requires fewer number of states as compared to Moore machine.

* Mealy machine can be complex compared to Moore machine.

* Moore machine should be preferred for the designs, where glitches are not a major problem.


* If the state of the design changes after certain duration (see Fig. 7.10), then we need to add the timer in the Verilog design which are we need to add one more process-block which performs following actions,

> Zero the timer : The value of the timer is set to zero, whenever the state of the system changes.
> 
> Stop the timer : Value of the timer is incremented till the predefined ‘maximum value’ is reached and then it should be stopped incrementing. Further, it’s value should not be set to zero until state is changed.


In timed Moore machine,
__Outputs depend on current external inputs__.
__Next states depend on time along with current states and current external inputs__.

