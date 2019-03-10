var text = argument[0];

var textSpeed = 1;
if (argument_count > 1)
    var textSpeed = argument[1];

with (obj_message)
{
    instance_destroy();
}

var notification = instance_create(0, 0, obj_message);
notification.message = text;
notification.textSpeed = textSpeed;
