
resource "aws_s3_bucket" "altera_infra_states" {
    bucket = "altera-infra-states"

    tags = {
        Name = "altera-infra-states"
        Environment = "dev"
        created_by = "terraform"
    }
}