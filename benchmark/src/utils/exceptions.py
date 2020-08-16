#!/usr/bin/env python3


class InitializationException(Exception):
    """Raise when initialization errors occur."""


class ChallengeNotFound(Exception):
    """Raise when challenge not found."""


class ChallengeNotCovered(Exception):
    """Raise when challenge not found."""


class TestNotFound(Exception):
    """Raise when test not found."""
