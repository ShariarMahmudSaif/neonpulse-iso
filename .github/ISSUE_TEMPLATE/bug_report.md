<!-- GitHub Issue Template for Bug Reports -->
name: Bug Report
description: Report a bug or issue
title: "[BUG] "
labels: ["bug"]

body:
  - type: markdown
    attributes:
      value: |
        # Bug Report
        
        Thanks for helping us improve NeonPulse OS! Please provide details about the issue.

  - type: textarea
    id: description
    attributes:
      label: Description
      description: Describe the bug clearly
      placeholder: "What happened?"
    validations:
      required: true

  - type: textarea
    id: steps
    attributes:
      label: Steps to Reproduce
      description: How to reproduce the issue
      placeholder: |
        1. Do X
        2. Do Y
        3. Observe Z
    validations:
      required: true

  - type: textarea
    id: expected
    attributes:
      label: Expected Behavior
      description: What should happen instead?
      placeholder: "What did you expect?"
    validations:
      required: true

  - type: textarea
    id: system_info
    attributes:
      label: System Information
      description: Run `neofetch` and paste output
      placeholder: |
        - NeonPulse OS v1.0.0
        - CPU: 
        - GPU: 
        - RAM:
      render: shell
    validations:
      required: true

  - type: textarea
    id: logs
    attributes:
      label: Relevant Logs
      description: Paste error messages or logs
      render: bash
