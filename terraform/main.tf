resource "null_resource" "test_ci" {
  provisioner "local-exec" {
    command = "echo 'branch protection works'"
  }
}
