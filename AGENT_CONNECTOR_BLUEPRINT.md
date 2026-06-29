# Agent Connector Blueprint

## Purpose

This document defines a safe assisted agent for the MILK ecosystem. The agent helps prepare and execute controlled actions across code repositories, public metadata records and archival deposits.

The agent must not act as an autonomous institutional authority. It is a technical assistant with limited tools, review gates and auditable logs.

## Core principle

Read first. Propose second. Execute only through a defined action with traceable output.

## Target services

- GitHub: repository review, branch creation, documentation commits, pull request preparation.
- Codeberg or Forgejo: mirror repository review and public documentation updates.
- Zenodo: draft deposit preparation, metadata checks and release package support.
- ORCID: public profile reading and update preparation through the proper authorised route.

## Required architecture

The agent should not hold long-lived platform credentials directly. Use a small connector gateway between the agent and the external services.

Agent -> Connector Gateway -> External Services

The gateway stores credentials in a protected environment, validates each requested action, records logs and blocks unsafe operations.

## Operating modes

### Mode 1: read_only

Allowed:

- list repositories;
- read files;
- inspect metadata;
- compare branches;
- check public records;
- prepare reports.

Blocked:

- file creation;
- file deletion;
- branch movement;
- release publication;
- public deposit submission.

### Mode 2: propose

Allowed:

- prepare file content;
- prepare branch names;
- prepare commit messages;
- prepare deposit metadata;
- prepare ORCID update drafts;
- prepare Codeberg or Forgejo sync plans.

Blocked:

- publishing;
- merging;
- destructive changes.

### Mode 3: execute_limited

Allowed only after explicit human approval:

- create a branch;
- create or update public documentation files;
- open a pull request or equivalent review request;
- create a draft release package;
- create a draft archival deposit.

Blocked by default:

- deleting files;
- rewriting repository history;
- changing repository visibility;
- changing ownership;
- changing licence without review;
- submitting a final public deposit without review;
- changing ORCID records without the account holder's authorised approval.

## Approval rule

Every write action must include:

1. service;
2. repository or record;
3. target branch or draft record;
4. exact files or metadata affected;
5. action type;
6. expected result;
7. rollback path;
8. human approval marker.

## GitHub connector actions

Minimum actions:

- get_repository;
- list_repositories;
- read_file;
- compare_refs;
- create_branch;
- create_file;
- update_file;
- open_pull_request;
- read_pull_request;
- list_changed_files.

Default branch writes should remain disabled. Pull request or review branch workflow is the default.

## Codeberg or Forgejo connector actions

Minimum actions:

- list_repositories;
- read_file;
- create_branch;
- create_file;
- update_file;
- open_merge_request or pull_request equivalent;
- compare_refs;
- mirror_status.

## Zenodo connector actions

Minimum actions:

- read_account_status;
- create_draft_deposit;
- upload_file_to_draft;
- update_draft_metadata;
- validate_draft_metadata;
- list_draft_files;
- prepare_publish_report.

Publishing remains a human decision.

## ORCID connector actions

Minimum actions:

- read_public_profile;
- prepare_profile_update;
- prepare_work_entry;
- prepare_funding_entry;
- prepare_affiliation_entry;
- validate_against_orcid_fields.

Direct writing requires the correct ORCID authorisation path. The agent must never ask for a password and must never store user login credentials.

## MILK safety rules

The agent must preserve separation between:

- Associação MILK;
- Atlas Vivo MILK;
- Eduardo Mauer;
- Nuno A.;
- OCSR;
- public documentation;
- protected methods;
- private records;
- restricted visual assets.

The agent must not publish:

- private records;
- unpublished restricted documents;
- internal Atlas or OCSR methods;
- restricted visual assets;
- unlicensed images;
- material without clear authorship;
- material without access level;
- material without version and provenance.

## Required output format

Every run must return:

- action summary;
- files or records read;
- files or records proposed;
- files or records changed;
- what stayed intact;
- regression risk;
- validation result;
- next human step.

## Minimal system prompt

You are the MILK connector agent. Work conservatively. Read before writing. Preserve public and protected layers. Do not publish, merge, delete, rewrite history, change licences, change authorship or submit deposits without explicit human approval. Every output must include changed, intact, regression risk, validation and next step.

## First deployment target

Start with read_only and propose modes only. Enable execute_limited only after the gateway, logs and platform authorisations are working.
