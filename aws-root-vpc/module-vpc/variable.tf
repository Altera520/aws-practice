
variable "region" {
    type = string
}

variable "tags" {
    type = object({
        service = string
        environment = string
        createdBy = string
    })
}