function run_tests()
% RUN_TESTS Standalone test runner for lts-kit.
%   Assembles a +lts/+util package sandbox under build/src (gitignored)
%   from this repository's files, then runs the MATLAB unittest suite in
%   tests/.
root = fileparts(mfilename('fullpath'));

sb = fullfile(root, 'build', 'src');
if exist(sb, 'dir')
    rmdir(sb, 's');
end

utilDir = fullfile(sb, '+lts', '+util');
mkdir(utilDir);
copyfile(fullfile(root, '*.m'), utilDir);
delete(fullfile(utilDir, 'run_tests.m'));

addpath(sb);
suite = testsuite(fullfile(root, 'tests'));
runner = matlab.unittest.TestRunner.withTextOutput;
results = runner.run(suite);
assertSuccess(results);
end
