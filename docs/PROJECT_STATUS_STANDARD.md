# TFAST public project status standard

Use these labels consistently in product READMEs and release pages:

| Status | Meaning |
| --- | --- |
| Proposed | Requirements and architecture only; implementation not verified. |
| Prototype | Early implementation, not suitable for production data. |
| Alpha | Features under development; breaking changes expected. |
| Beta | Testable build with known limitations and documented scope. |
| Release candidate | Feature-complete candidate undergoing final verification. |
| Stable | Versioned release with documented tests, installation and support boundaries. |
| Archived | Not actively maintained; avoid new production deployments. |

## Required README sections

1. Product purpose and target users.
2. Current status and last verified release/date.
3. Upstream project, exact version, original license and NOTICE requirements.
4. TFAST-specific implemented changes (separate from planned features).
5. Installation and configuration using placeholders, never real secrets.
6. Supported platforms and tested integrations.
7. Security, data handling, backup and recovery guidance.
8. Screenshots or reproducible demo with synthetic data.
9. Testing evidence, known limitations and changelog.
10. Support and commercial customization terms.

A roadmap item or feature specification must not be advertised as tested functionality until implementation and verification are documented.
