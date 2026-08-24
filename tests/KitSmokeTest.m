function tests = KitSmokeTest
tests = functiontests(localfunctions);
end

function testClampAndSaturate(testCase)
verifyEqual(testCase, lts.util.clamp(5, 0, 1), 1);
verifyEqual(testCase, lts.util.clamp(-3, 0, 1), 0);
verifyEqual(testCase, lts.util.clamp([0.2 0.5], 0, 1), [0.2 0.5]);
verifyEqual(testCase, lts.util.saturate(1.7), 1);
verifyEqual(testCase, lts.util.saturate(-0.2), 0);
end

function testFieldHelpers(testCase)
s = struct('a', 1);
verifyEqual(testCase, lts.util.fieldOr(s, 'a', 9), 1);
verifyEqual(testCase, lts.util.fieldOr(s, 'b', 9), 9);
verifyEqual(testCase, lts.util.fieldOrDefault(s, 'b', 'x'), 'x');
end

function testFiniteHelpers(testCase)
verifyEqual(testCase, lts.util.maxFinite([1 NaN 3]), 3);
verifyEqual(testCase, lts.util.minFinite([1 NaN -2]), -2);
end

function testMergeStructRecursive(testCase)
base = struct('a', 1, 'nested', struct('x', 1, 'y', 2));
overlay = struct('nested', struct('y', 20, 'z', 30), 'b', 2);
merged = lts.util.mergeStructRecursive(base, overlay);
verifyEqual(testCase, merged.a, 1);
verifyEqual(testCase, merged.b, 2);
verifyEqual(testCase, merged.nested.x, 1);
verifyEqual(testCase, merged.nested.y, 20);
verifyEqual(testCase, merged.nested.z, 30);
end

function testPhysicalConstantsG(testCase)
% The single named gravity constant every package reads (VehicleManager.g
% delegates to it).
verifyEqual(testCase, lts.util.PhysicalConstants.g, 9.80665);
end

function testShellQuoteWrapsFreeText(testCase)
q = lts.util.shellQuote('driver name');
verifyTrue(testCase, contains(q, 'driver name'));
verifyTrue(testCase, numel(q) >= numel('driver name') + 2);
end
