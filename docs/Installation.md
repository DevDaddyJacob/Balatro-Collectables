# Installing Collectables

Installing the mod is fairly simple and straight forward.

## Step 1: Install Steamodded
Before installing the mod, you will need to install Steamodded, the Balatro mod loader.

Instructions on how to install Steamodded are found on their [wiki](https://github.com/Steamodded/smods/wiki#how-to-install-steamodded).

> [!IMPORTANT]
> Collectables requires a specific version of smods / steamodded, specifically version `1.0.0~ALPHA-1409a-STEAMODDED` or later.
> If you are following the Steamodded installation instructions, ensure you are **not** using the "old-calc" version.
> 
> This specific version can be found at [this](https://github.com/Steamodded/smods/tree/a1e1f56be0548ba295812beeb4b0e816a1b7f430) point in the repo history, however if you are using the latest version from the main branch you should be fine.
> 
> <details>
> <summary>Click me for a more technical explination for the specific version requirement</summary>
> 
> This is because the mod makes use of a handful of recent pull request which added support for various different things:
> <ul>
>   <li>Support for nested config values (Introduced by <a href="https://github.com/Steamodded/smods/pull/407">PR#407</a> in version <b>1.0.0~ALPHA-1314d-STEAMODDED</b>)</li>
>   <li>Support for X chips (Introduced by <a href="https://github.com/Steamodded/smods/commit/8bbc6dd89a5e8018b1f18ccef6ac6e549a4d7c10">commit 8bbc6dd</a> in version <b>1.0.0~ALPHA-1409a-STEAMODDED</b>)</li>
> </ul>
> 
> </details>


## Step 2: Download Collectables
Once Steamodded is installed, all you need to do is download the mod code and move it to the appropriate location on your system.

Just like the Steamodded install, there are 2 ways you can do this, the first is using a direct download, and the second is using Git.

If you are not as comfortable with using the command line or don't know what Git is, I recommend you do the direct download method.

<details>
<summary><b>Download Using Direct Download</b></summary>

1. [Download the latest source code](https://github.com/JayPaulinCodes/Balatro-Collectables/archive/refs/heads/main.zip) from the main branch as a zip file.

2. In your Balatro mods folder (see table below for mods folder locations) you made when installing Steamodded, extract the mod's source code to a new folder named `Collectables`, the folder should look something similar to [this image](https://i.imgur.com/GwXfqYr.png).

| Operating System                                    	| Balatro Mods Folder Path                                                                                                       	|
|-----------------------------------------------------	|--------------------------------------------------------------------------------------------------------------------------------	|
| Windows                                             	| `%AppData%/Balatro/Mods`                                                                                                       	|
| MacOS                                               	| `~/Library/Application Support/Balatro/Mods`                                                                                   	|
| Linux (WINE/Proton)                                 	| `~/.local/share/Steam/steamapps/compatdata/2379780/pfx/drive_c/users/steamuser/AppData/Roaming/Balatro/Mods`                   	|
| Linux (WINE/Proton) with snap installation of Steam 	| `~/snap/steam/common/.local/share/Steam/steamapps/compatdata/2379780/pfx/drive_c/users/steamuser/AppData/Roaming/Balatro/Mods` 	|

</details>

<br>

<details>
<summary><b>Download Using Git</b></summary>

> [!NOTE]
> This portion of the guide assumes you either already have Git installed, or know how and are able to install it.

1. If Git isn't installed, install it now.

2. Open your command line, and navigate to the mods folder you made when installing Steamodded (see table below for mods folder locations).

| Operating System                                    	| Balatro Mods Folder Path                                                                                                       	|
|-----------------------------------------------------	|--------------------------------------------------------------------------------------------------------------------------------	|
| Windows                                             	| `%AppData%/Balatro/Mods`                                                                                                       	|
| MacOS                                               	| `~/Library/Application Support/Balatro/Mods`                                                                                   	|
| Linux (WINE/Proton)                                 	| `~/.local/share/Steam/steamapps/compatdata/2379780/pfx/drive_c/users/steamuser/AppData/Roaming/Balatro/Mods`                   	|
| Linux (WINE/Proton) with snap installation of Steam 	| `~/snap/steam/common/.local/share/Steam/steamapps/compatdata/2379780/pfx/drive_c/users/steamuser/AppData/Roaming/Balatro/Mods` 	|

3. Clone the repository using the following command:
```shell
git clone https://github.com/JayPaulinCodes/Balatro-Collectables.git Collectables
```

</details>


# Updating Collectables

Updating the mod is fairly simple, but is different depending on which installation method you chose to use in step 2 of the installation.


<details>
<summary><b>Updating Direct Download</b></summary>

1. Delete your Collectables mod folder you made when installing the mod.

2. Follow direct download installation steps.

</details>

<br>

<details>
<summary><b>Update Git Download</b></summary>

> [!NOTE]
> This portion of the guide assumes you already have Git installed

1. Open your command line, and navigate to the Collectables mod folder you made when installing (see table below for folder locations).

| Operating System                                    	| Balatro Mods Folder Path                                                                                                       	|
|-----------------------------------------------------	|--------------------------------------------------------------------------------------------------------------------------------	|
| Windows                                             	| `%AppData%/Balatro/Mods/Collectables`                                                                                                       	|
| MacOS                                               	| `~/Library/Application Support/Balatro/Mods/Collectables`                                                                                   	|
| Linux (WINE/Proton)                                 	| `~/.local/share/Steam/steamapps/compatdata/2379780/pfx/drive_c/users/steamuser/AppData/Roaming/Balatro/Mods/Collectables`                   	|
| Linux (WINE/Proton) with snap installation of Steam 	| `~/snap/steam/common/.local/share/Steam/steamapps/compatdata/2379780/pfx/drive_c/users/steamuser/AppData/Roaming/Balatro/Mods/Collectables` 	|

2. Update the repository with the following command
```shell
git pull
```

</details>