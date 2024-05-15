#!/bin/bash

# Demande de l'utilisateur TikTok
read -p "Entrez le nom d'utilisateur TikTok: " username

# Fonction pour générer des informations aléatoires en utilisant l'API randomuser.me
generate_fake_info() {
  response=$(curl -s https://randomuser.me/api/?nat=fr)
  first_name=$(echo $response | jq -r '.results[0].name.first')
  last_name=$(echo $response | jq -r '.results[0].name.last')
  girlfriend_username=$(echo "tiktok_user_$(shuf -i 1000-9999 -n 1)")
  address=$(echo $response | jq -r '.results[0].location.street.number') $(echo $response | jq -r '.results[0].location.street.name'), $(echo $response | jq -r '.results[0].location.city'), $(echo $response | jq -r '.results[0].location.state'), France
  age=$(echo $response | jq -r '.results[0].dob.age')
  phone=$(echo $response | jq -r '.results[0].phone')

  echo "Informations pour l'utilisateur TikTok '$username':"
  echo "Nom: $last_name"
  echo "Prénom: $first_name"
  echo "Petite amie: $girlfriend_username"
  echo "Adresse: $address"
  echo "Âge: $age"
  echo "Téléphone: $phone"
}

# Vérification de la présence de curl et jq
if ! command -v curl &> /dev/null
then
  echo "La commande curl est nécessaire, mais elle n'est pas installée. Veuillez l'installer et réessayer."
  exit
fi

if ! command -v jq &> /dev/null
then
  echo "La commande jq est nécessaire, mais elle n'est pas installée. Veuillez l'installer et réessayer."
  exit
fi

# Génération et affichage des informations aléatoires
generate_fake_info
