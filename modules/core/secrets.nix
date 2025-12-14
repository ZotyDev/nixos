{ username, ...}:
{
  # Location of secrets file
  sops.defaultSopsFile = ../../secrets/secrets.yaml;

  # Use host SSH key to decrypt
  sops.age.keyFile = "/home/${username}/.config/sops/age/keys.txt";

  # Define secrets to be used
  sops.secrets = {
    "user-password" = {
      neededForUsers = true;
    };

    "ssh-private-key" = {
      owner = username;
      mode = "0400";
    };
  };
}