const std = @import("std");

const Signal = struct {
    demand: i32,
    capacity: i32,
    latency: i32,
    risk: i32,
    weight: i32,
};

const threshold: i32 = 157;
const risk_penalty: i32 = 6;
const latency_penalty: i32 = 2;
const weight_bonus: i32 = 2;

fn score(signal: Signal) i32 {
    return signal.demand * 2 + signal.capacity + signal.weight * weight_bonus
        - signal.latency * latency_penalty - signal.risk * risk_penalty;
}

fn classify(signal: Signal) []const u8 {
    return if (score(signal) >= threshold) "accept" else "review";
}

test "fixture decisions" {
    const signal_case_1 = Signal{ .demand = 82, .capacity = 97, .latency = 22, .risk = 16, .weight = 10 };
    try std.testing.expectEqual(@as(i32, 141), score(signal_case_1));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_1), "review"));
    const signal_case_2 = Signal{ .demand = 91, .capacity = 73, .latency = 13, .risk = 12, .weight = 8 };
    try std.testing.expectEqual(@as(i32, 173), score(signal_case_2));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_2), "accept"));
    const signal_case_3 = Signal{ .demand = 105, .capacity = 89, .latency = 14, .risk = 18, .weight = 7 };
    try std.testing.expectEqual(@as(i32, 177), score(signal_case_3));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_3), "accept"));
}

const DomainReview = struct {
    signal: i32,
    slack: i32,
    drag: i32,
    confidence: i32,
};

fn domainReviewScore(item: DomainReview) i32 {
    return item.signal * 2 + item.slack + item.confidence - item.drag * 3;
}

fn domainReviewLane(item: DomainReview) []const u8 {
    const value = domainReviewScore(item);
    if (value >= 140) return "ship";
    if (value >= 105) return "watch";
    return "hold";
}

test "domain review lane" {
    const item = DomainReview{ .signal = 57, .slack = 41, .drag = 29, .confidence = 88 };
    try std.testing.expectEqual(@as(i32, 156), domainReviewScore(item));
    try std.testing.expect(std.mem.eql(u8, domainReviewLane(item), "ship"));
}
