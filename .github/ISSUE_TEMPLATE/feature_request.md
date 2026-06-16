<!-- GitHub Issue Template for Feature Requests -->
name: Feature Request
description: Suggest a new feature
title: "[FEATURE] "
labels: ["enhancement"]

body:
  - type: markdown
    attributes:
      value: |
        # Feature Request
        
        Have an idea to make NeonPulse OS better? Let us know!

  - type: textarea
    id: description
    attributes:
      label: Description
      description: What feature would you like?
      placeholder: "Describe the feature..."
    validations:
      required: true

  - type: textarea
    id: use_case
    attributes:
      label: Use Case
      description: Why is this feature needed?
      placeholder: "How would this help you or the community?"
    validations:
      required: true

  - type: dropdown
    id: category
    attributes:
      label: Category
      options:
        - UI/Theme
        - Gaming
        - Creative Tools
        - Security
        - Performance
        - Documentation
        - Other
    validations:
      required: true

  - type: textarea
    id: alternatives
    attributes:
      label: Alternatives Considered
      description: Any other solutions?
      placeholder: "Have you thought of other ways?"
