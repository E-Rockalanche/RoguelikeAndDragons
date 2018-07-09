var stack = argument0;
var temp = ds_stack_create();
while(ds_stack_size(stack)) {
    ds_stack_push(temp, ds_stack_pop(stack));
}
ds_stack_copy(stack, temp);
ds_stack_destroy(temp);
