# Recent Commits Github Action

Generates a message that summarizes all the most recent commits pushed to your main branch! This message can be used with a notification bot to alert everyone on your team of the new changes.

> ...huh?

If I make a couple of commits locally, and then push them, the action will create a message like this:

```
New commits to Auroratide/recent-commits:
  <209dbe9|Link to commit>: Fixed tests in the product controller
  <eaaebc9|Link to commit>: Extracted discount logic into the product domain model
  Author: <@Auroratide>
```

* [Usage](#usage)
  * [Author JSON File](#author-json-file)
* [Why?](#why)
* [License](#license)

## Usage

```
uses: Auroratide/recent-commits@v1
id: recent-commits
with:
  github-token: ${{ secrets.GITHUB_TOKEN }}
  main-branch: main
  last-push-branch: last-push-to-main
  author-file: authors.json
```

| Parameter | Default Value | Description |
| --------- | --------- | ----------- |
| github-token | **Required** | A github token with permissions to fetch and push branches, used to keep the last-push-branch up to date with the main-branch. |
| main-branch | `main` | Your main branch, or perhaps the branch on which you want code reviews to occur. |
| last-push-branch | `last-push-to-main` | Name of an automatically facilitated branch which will point to the last commit pushed to the main branch. |
| author-file | **Optional** | Name of a file in your `.github` folder which stores notification ids of people on your team. E.g. `authors.json` |

### Author JSON File

This file is optional, and when not provided will simply display the user's Github username.

The `author-file` must be a JSON file of the following schema:

```json
{
   "users": [ {
      "github": STRING,
      "notify_id": STRING
   } ]
}
```

Each `github` value is the user's Github username. The `notify_id` value is whatever their user id is in whatever notification tool you are using.

## Why?

[Continuous integration](https://martinfowler.com/articles/continuousIntegration.html) via [trunk-based development](https://martinfowler.com/articles/branching-patterns.html#continuous-integration) is the fastest way for a team to collaborate on a project. That is, rather than gatekeep all the code that goes to production via feature branches, let everyone develop directly on the main branch. Everyone always has the most up-to-date code, and releases to production happen in minutes rather than hours (or even days).

That said, we don't want _any and all_ code to live forever: we conduct **code reviews** to ensure our code is high quality: consistent, easy to understand, free of bugs, tested, and so on. How do we do code reviews without blocking people from pushing to main?

1. [Pair programming](https://martinfowler.com/articles/on-pair-programming.html) is literally continuous code review. But in a remote-first world, it is not always possible or practical to pair.
2. **Code review commits _after_ they've been pushed to main!**

The **recent-commits github action** facilitates this cleanly! For example, on teams I've been on:

* When someone pushes a commit, the action generates a message summarizing the commits.
* A Slack Bot then notifies in a channel everyone on the team links to the commits so they can be reviewed.
* People _asynchronously_ leave comments on the commits, and then react to the Slack message saying they've reviewed it.

And so, we've achieved continuous integration with usually same-day code review feedback, all while allowing individuals to work and review at their own pace.

## License

[ISC](./LICENSE).
