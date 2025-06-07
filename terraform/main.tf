resource "null_resource" "test_ci" {
  provisioner "local-exec" {
    command = "echo 'CI/CD Pipeline funktioniert!'"
  }
}
