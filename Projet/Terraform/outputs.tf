output "instance_ips" {
  description = "The public IP addresses of the EC2 instances"
  value       = aws_instance.app[*].public_ip
}
