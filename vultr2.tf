terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.17.1"
    }
  }
}

provider "vultr" {
  api_key = "SILLVA2A6J3F6S4SKKSNXAPFNZFMWNFF2MRA"
}

resource "vultr_instance" "vm-Alassane" {
  plan   = "vc2-1c-1gb" # Ex: "vc2-1c-1gb"
  region = "fra"        # Ex: "ewr"
  os_id  = "387"

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y docker.io
              sudo systemctl start docker
              sudo systemctl enable docker

              # Create a Dockerfile
              cat <<DOCKERFILE > Dockerfile
                FROM nginx
                COPY . /usr/share/nginx/html
                EXPOSE 80
                CMD ["nginx", "-g", "daemon off;"]
              DOCKERFILE

              # Build Docker image
              sudo docker build -t my-nginx-image .

              # Run Docker container
              sudo docker run -d -p 80:80 my-nginx-image
              EOF
}
