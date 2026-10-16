# Pope Discord Bot

The Pope bot is a discord app aiming to increase the overall activity of the server, as well as add a way for all members to compete with each other.

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-3.10.0-green.svg)]()

## Description

Every day, at 9.37pm CET (Polish time), members can say "2137" in <a href="https://discord.com/channels/1334532846077087816/1430641405243559947" target="_blank">#2137</a> to recieve a kremówka from the Pope himself!

It makes the atmosphere more competitive, but also more friendly at the same time, as well as keeping the server active.

## Getting started

### Meet the standards

Before you start, make sure you have read and understood the following documents:

- [GI Tech Standards](https://github.com/gi-org-pl/gi-tech-standards)
- [Before start GitHub configuration](https://github.com/gi-org-pl/gi-tech-standards/blob/main/docs/github/INDEX.md)

### Environment

This app uses docker-based virtualization to run. In order to set up project, follow these steps:

1. Clone the project by running:
    ```shell
    git clone git@github.com:gi-org-pl/pope-discord-bot.git
    ```
2. Prepare an environment variables file by copying `.env.dist` to `.env` and fill it with your data.
    ```shell
    cd pope-discord-bot
    cp .env.dist .env
    ```
3. Use `docker compose` to set up the environment

    ```shell
    docker compose up -d --build
    ```

    Packages and empty data files in `src/logs/` will be configured automatically.

4. Local project should be up and running. Preview app logs by running:
    ```shell
    docker compose logs -f app
    ```

The container runs in the `Europe/Warsaw` timezone, so the 21:37 checks and the scheduled resets use Polish time.

### Running the project tip

> **Do not execute NPM or any other commands regarding project from your host machine, use container shell instead.**
> For example, to install a package run:
>
> ```shell
> docker compose exec app npm install <package>
> ```
>
> It will execute the `npm install <package>` command in the container shell.

### Clean up

To shut Docker containers, run:

```shell
docker compose down
```

## Release & deploy

> Before merging Pull Request to the main branch, make sure to bump the project version in the `package.json` file, line
> `3`.
>
> Then it is a good practice to run `npm install` inside a docker container to update the `package-lock.json` file.

The production image is built from the `production` target. The bot keeps its data in `/app/src/logs`, so mount a
persistent directory there:

```shell
docker build --target production -t ghcr.io/gi-org-pl/pope-discord-bot .
docker run -d --env-file .env -v /path/to/logs:/app/src/logs ghcr.io/gi-org-pl/pope-discord-bot
```

## FAQ

### General Questions

**Q: Can I base my bot on this app?**

A: Yes, the MIT license allows both private and commercial use.

**Q: How does the bot sort the leaderboard?**

A: The leaderboard is sorted in three ways - first the number of cream cakes, then the stream of cream cakes, and finally, the user id as a tie breaker.

### Technical Questions

**Q: How do I contribute?**

A: Feel free to contact me on <a href="https://discordapp.com/users/489418032368713728" target="_blank">discord</a> and suggest a feature, or create a pull request!

**Q: How do I report a bug?**

A: Please create an issue on GitHub with a detailed description, reproduction steps and optionally a screenshot.

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

### MIT License Summary

- ✅ Commercial use
- ✅ Modification
- ✅ Distribution
- ✅ Private use
- ❌ Liability
- ❌ Warranty

---
