#!/usr/bin/env python3


def parse_results(output: str, is_pov: bool):
    """ Parses out the number of passed and failed tests from cb-test output
    Args:
        output (str): Raw output from running cb-test
        is_pov (bool): The running test was a pov
    Returns:
        (int, int): # of tests run, # of tests passed
    """

    # If the test failed to run, consider it failed
    if 'TOTAL TESTS' not in output:
        print('\nWARNING: there was an error running a test')
        print(output)
        return 0, 0

    if 'timed out' in output:
        print('\nWARNING: test(s) timed out')

    # Parse out results
    total = output.split('TOTAL TESTS: ')[1].split('\n')[0]
    passed = output.split('TOTAL PASSED: ')[1].split('\n')[0]

    if is_pov:
        passed = '0' if passed == '1' else '1'

    return total, passed
