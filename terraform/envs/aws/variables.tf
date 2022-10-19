variable "ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAmT6ztUvNgP6HZPo5qhYFZtZHvBET4CDjFhsv8TopqhZ9zn77JTTBuWqTNYmVt+fceSRvfBL7VBi8BBbav+i4KJlm6uunbT0JIWimz5/fHUqMU5H7lejZl9ExhxJreQ8LkPteRHKbwwIkglYvjSf1UeX/S9JPKBIMcvsuJfOLnfYLVvfSQ+gRfkitdcKzXDtmC++jhNjS6s6X9+4CJdaKeJKqSFu53aZubnhDHZVjFQv2NwVY597KWydX1NQ6vlhfpvoAUg03FVwKsVHaLqUUJ/r2ZTFhkoONiWV/MzCappMSsyOKQw7HKkfzzncFcD6P9Q6/FtbeenYRARgK0RbZbB+IFYvgsfvQgCW1ZzJ+dHf65NteV04XC3hFnm3eA59/mmRv7c7PARBwi8pN09uNsqAfF0qdfOdMekoclzSFwzsZjVqMEh2B30lwdOAYeLyasPbeWw+tf0ozDvcns4Nck1pYKa5hXXh7CycuCdyOjt7wXYPFOZiaFrghbU/1fc5eKWLNSEwUFhrlo4MjP3MCrpb1a3QlXGWd8WI7KGjQXneFFJmSN2As+vMuipDFDrgT+ADK6WPKjwFQoj6OJHi5KEPqvNh/hRKAyZKDrXDu/mgRvoMVdrsuJIB75egC7rObLaWpo7n7H2CSYafq4vkWQtpThODJ3k340HeaUMY6JC0="
}

variable "tags" {
  type = map(any)

  default = {
    Environment = "sandbox"
    ManagedBy   = "ansible"
    CreatedBy   = "Terraform"
  }
}

variable "az" {
  type    = string
  default = "eu-central-1c"
}
