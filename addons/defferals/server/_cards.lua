log("debug", "defferals", "_cards.lua loaded")

local cards <const> = {
    homeCard = ([==[{
        "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
        "type": "AdaptiveCard",
        "version": "1.4",
        "body": [
            {
                "type": "TextBlock",
                "text": "Bienvenue sur %s",
                "weight": "bolder",
                "size": "large"
            },
            {
                "type": "TextBlock",
                "text": "%s",
                "weight": "default",
                "size": "medium",
                "isSubtle": true
            },
            {
                "type": "Image",
                "url": "%s",
                "size": "extralarge",
                "horizontalAlignment": "center"
            }
        ],
        "actions": [
            {
                "type": "Action.Submit",
                "title": "Se connecter",
                "data": {
                    "action": "loginPage"
                }
            },
            {
                "type": "Action.Submit",
                "title": "S'inscrire",
                "data": {
                    "action": "registrationPage"
                }
            },
            {
                "type": "Action.Submit",
                "title": "Informations",
                "data": {
                    "action": "infoPage"
                }
            }
        ]
    }]==]):format(GetConvar("pvp:serverName", "PVP Gamemode"), GetConvar("pvp:serverDiscord", "https://discord.gg/pvp"), GetConvar("pvp:bannerUrl", "https://cdn.discordapp.com/attachments/1270395429883744391/1307163364950016050/pvp_logo.png?ex=67394e40&is=6737fcc0&hm=af3152e46f59a4e5b5c18c08162cdda29128be89f8fb882567e13f6392d45428&")),

    loginCard = ([==[{
        "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
        "type": "AdaptiveCard",
        "version": "1.4",
        "body": [
            {
                "type": "TextBlock",
                "text": "Voici la page de connexion",
                "weight": "bolder",
                "size": "large"
            },
            {
                "type": "TextBlock",
                "text": "Veuillez entrer votre nom d'utilisateur et votre mot de passe pour vous connectez, si vous n'avez pas de compte, vous pouvez vous inscrire en revenant sur la page d'accueil.",
                "weight": "default",
                "size": "medium",
                "isSubtle": true
            },
            {
                "type": "Input.Text",
                "id": "username",
                "label": "Nom d'utilisateur",
                "placeholder": "Entrez votre nom d'utilisateur",
                "maxLength": 20
            },
            {
                "type": "Input.Text",
                "id": "password",
                "label": "Mot de passe",
                "placeholder": "Entrez votre mot de passe",
                "maxLength": 20
            },
            {
                "type": "TextBlock",
                "text": "Les données saisies sont soumises à la protection des données (RGPD), elles ne seront pas partagées avec des tiers.",
                "size": "small",
                "wrap": true,
                "isSubtle": true
            }
        ],
        "actions": [
            {
                "type": "Action.Submit",
                "title": "Se connecter",
                "data": {
                    "action": "loginButton"
                }
            },
            {
                "type": "Action.Submit",
                "title": "Retourner à l'accueil",
                "data": {
                    "action": "returnHomePage"
                }
            }
        ]
    }]==]):format(),
}

_ENV.cards = cards