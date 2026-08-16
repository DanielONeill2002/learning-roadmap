-- ============================================================
-- seed_adops.sql - practice marketing database for Phase 1
-- ============================================================
-- Builds three tables: campaigns, ads, daily_metrics.
-- RERUNNABLE: drops and recreates everything each time, so a
-- broken experiment is never fatal - just run the seed again.
-- (This pattern is called idempotency; it returns in Week 13.)
--
-- Your three hand-made campaigns live on as ids 1-3.
--
-- The data contains deliberate stories - you will meet them in
-- exercises over Weeks 3-6:
--   * campaigns 11 and 14 have NO ads (DSA auto-generates its
--     creatives; 14 just launched, creatives pending)
--   * campaign 10 exists but has NO metrics (paused before the
--     reporting window opened)
--   * campaign 7 pauses mid-window: metrics stop after Jul 28
--   * campaign 9 ends Aug 2: metrics stop
--   * campaign 8, Aug 5-7: tracking outage - conversions are
--     NULL (unknown), NOT zero. NULL vs 0 matters.
--   * campaign 5, Aug 3-4: bid-war spend spike
--   * Search campaigns dip on weekends (Jul 25-26, Aug 1-2, Aug 8-9)
-- Metrics window: 2026-07-21 to 2026-08-10 (21 days).
-- ============================================================

DROP TABLE IF EXISTS daily_metrics;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS campaigns;

CREATE TABLE campaigns (
    campaign_id  integer,
    name         text,
    channel      text,
    daily_budget numeric,
    launched_on  date,
    status       text
);

CREATE TABLE ads (
    ad_id       integer,
    campaign_id integer,
    headline    text,
    format      text,
    created_on  date
);

CREATE TABLE daily_metrics (
    metric_date  date,
    campaign_id  integer,
    spend        numeric,
    impressions  integer,
    clicks       integer,
    conversions  integer
);

INSERT INTO campaigns (campaign_id, name, channel, daily_budget, launched_on, status) VALUES
    (1,  'Search - Brand',                'Search',  45.00, '2026-07-01', 'active'),
    (2,  'Meta - Brand',                  'Meta',    30.00, '2026-07-15', 'active'),
    (3,  'Native - Brand',                'Native',  60.00, '2026-08-01', 'active'),
    (4,  'Search - Competitors',          'Search',  25.00, '2026-06-10', 'active'),
    (5,  'Search - Generic Wellness',     'Search',  55.00, '2026-06-01', 'active'),
    (6,  'Meta - Retargeting',            'Meta',    35.00, '2026-06-20', 'active'),
    (7,  'Meta - Lookalike Broad',        'Meta',    40.00, '2026-07-05', 'paused'),
    (8,  'Native - Taboola Whitelist',    'Native',  70.00, '2026-06-15', 'active'),
    (9,  'Native - Outbrain Test',        'Native',  20.00, '2026-07-20', 'ended'),
    (10, 'Display - Programmatic Reach',  'Display', 30.00, '2026-06-05', 'paused'),
    (11, 'Search - DSA Catchall',         'Search',  15.00, '2026-08-10', 'active'),
    (12, 'Meta - Creator UGC Test',       'Meta',    25.00, '2026-08-05', 'active'),
    (13, 'Display - Retargeting Banners', 'Display', 18.00, '2026-07-01', 'active'),
    (14, 'Native - MSN Expansion',        'Native',  45.00, '2026-08-12', 'active');

INSERT INTO ads (ad_id, campaign_id, headline, format, created_on) VALUES
    (1,  1,  'Official Site - Free UK Delivery',        'image',    '2026-07-01'),
    (2,  1,  'Rated 4.8 Stars by 12,000 Customers',     'image',    '2026-07-01'),
    (3,  1,  'Summer Sale - Up To 30 Percent Off',      'image',    '2026-07-20'),
    (4,  2,  'The Morning Routine Upgrade',             'video',    '2026-07-15'),
    (5,  2,  'Why 12,000 Customers Switched',           'carousel', '2026-07-15'),
    (6,  2,  'Real Results in 30 Days',                 'video',    '2026-07-28'),
    (7,  3,  '7 Signs You Need Better Sleep',           'image',    '2026-08-01'),
    (8,  3,  'The Supplement Doctors Discuss',          'image',    '2026-08-01'),
    (9,  4,  'Better Than The Big Brands - See Why',    'image',    '2026-06-10'),
    (10, 4,  'The Honest Alternative - Compare Us',     'image',    '2026-06-10'),
    (11, 5,  'Energy Slump at 3pm? Read This',          'image',    '2026-06-01'),
    (12, 5,  'Nutritionist-Formulated Daily Greens',    'image',    '2026-06-01'),
    (13, 5,  'One Scoop. 62 Ingredients.',              'image',    '2026-06-25'),
    (14, 5,  'Subscribe and Save 20 Percent',           'image',    '2026-07-10'),
    (15, 6,  'You Left Something Behind',               'carousel', '2026-06-20'),
    (16, 6,  'Still Thinking It Over? 10 Percent Off',  'image',    '2026-06-20'),
    (17, 6,  'Your Cart Misses You',                    'image',    '2026-07-08'),
    (18, 7,  'The Wellness Habit Everyone Is Starting', 'video',    '2026-07-05'),
    (19, 7,  'From Tired to Thriving',                  'video',    '2026-07-05'),
    (20, 8,  'Doctors Were Asked About This Greens Powder', 'image', '2026-06-15'),
    (21, 8,  'The 3-Second Morning Habit',              'image',    '2026-06-15'),
    (22, 8,  'UK Mums Are Obsessed With This Drink',    'image',    '2026-07-02'),
    (23, 8,  'What Happens After 30 Days of Greens',    'image',    '2026-07-18'),
    (24, 9,  'The Drink Replacing Multivitamins',       'image',    '2026-07-20'),
    (25, 9,  'Why Nutritionists Drink This Daily',      'image',    '2026-07-20'),
    (26, 10, 'Feel Better Every Day',                   'image',    '2026-06-05'),
    (27, 12, 'I Tried It For 30 Days - Honest Review',  'video',    '2026-08-05'),
    (28, 12, 'My Nan Asked What I Am Drinking',         'video',    '2026-08-05'),
    (29, 12, 'Unboxing The Viral Greens',               'video',    '2026-08-07'),
    (30, 13, 'Come Back For 15 Percent Off',            'image',    '2026-07-01');

-- Metrics: 2026-07-21 to 2026-08-10.
-- Campaign 1: Search - Brand (budget 45, weekend dips)
INSERT INTO daily_metrics (metric_date, campaign_id, spend, impressions, clicks, conversions) VALUES
    ('2026-07-21', 1, 44.10,  9800, 470, 21),
    ('2026-07-22', 1, 45.00,  9950, 481, 23),
    ('2026-07-23', 1, 43.75,  9600, 452, 19),
    ('2026-07-24', 1, 44.80,  9870, 468, 22),
    ('2026-07-25', 1, 31.20,  7100, 322, 14),
    ('2026-07-26', 1, 29.85,  6800, 301, 12),
    ('2026-07-27', 1, 44.95,  9910, 475, 24),
    ('2026-07-28', 1, 45.00, 10020, 488, 25),
    ('2026-07-29', 1, 44.20,  9750, 461, 20),
    ('2026-07-30', 1, 45.00,  9990, 483, 22),
    ('2026-07-31', 1, 44.60,  9820, 470, 21),
    ('2026-08-01', 1, 30.55,  6950, 310, 13),
    ('2026-08-02', 1, 31.90,  7200, 328, 15),
    ('2026-08-03', 1, 45.00, 10050, 492, 26),
    ('2026-08-04', 1, 44.35,  9780, 466, 21),
    ('2026-08-05', 1, 45.00,  9940, 479, 23),
    ('2026-08-06', 1, 44.70,  9860, 472, 22),
    ('2026-08-07', 1, 44.90,  9900, 476, 24),
    ('2026-08-08', 1, 30.10,  6880, 305, 12),
    ('2026-08-09', 1, 32.40,  7350, 336, 16),
    ('2026-08-10', 1, 45.00, 10000, 485, 25);

-- Campaign 2: Meta - Brand (budget 30)
INSERT INTO daily_metrics (metric_date, campaign_id, spend, impressions, clicks, conversions) VALUES
    ('2026-07-21', 2, 29.40, 18200, 340, 9),
    ('2026-07-22', 2, 30.00, 18900, 355, 11),
    ('2026-07-23', 2, 28.75, 17800, 328, 8),
    ('2026-07-24', 2, 29.90, 18600, 349, 10),
    ('2026-07-25', 2, 30.00, 19100, 362, 12),
    ('2026-07-26', 2, 29.60, 18700, 351, 10),
    ('2026-07-27', 2, 28.90, 17900, 331, 9),
    ('2026-07-28', 2, 30.00, 18800, 356, 11),
    ('2026-07-29', 2, 29.20, 18100, 336, NULL),
    ('2026-07-30', 2, 30.00, 19000, 360, 12),
    ('2026-07-31', 2, 29.75, 18500, 347, 10),
    ('2026-08-01', 2, 30.00, 19200, 365, 13),
    ('2026-08-02', 2, 29.50, 18400, 344, 9),
    ('2026-08-03', 2, 28.80, 17700, 325, 8),
    ('2026-08-04', 2, 30.00, 18950, 358, 11),
    ('2026-08-05', 2, 29.30, 18200, 339, 10),
    ('2026-08-06', 2, 30.00, 19050, 361, 12),
    ('2026-08-07', 2, 29.85, 18650, 352, 11),
    ('2026-08-08', 2, 29.10, 18000, 333, 9),
    ('2026-08-09', 2, 30.00, 19150, 363, 12),
    ('2026-08-10', 2, 29.65, 18550, 350, 10);

-- Campaign 3: Native - Brand (launched Aug 1 - only 10 days of data)
INSERT INTO daily_metrics (metric_date, campaign_id, spend, impressions, clicks, conversions) VALUES
    ('2026-08-01', 3, 58.20, 96000, 610, 7),
    ('2026-08-02', 3, 60.00, 99500, 641, 9),
    ('2026-08-03', 3, 59.10, 97800, 622, 8),
    ('2026-08-04', 3, 60.00, 99900, 648, 10),
    ('2026-08-05', 3, 58.85, 97100, 618, 7),
    ('2026-08-06', 3, 60.00, 99700, 645, 9),
    ('2026-08-07', 3, 59.40, 98300, 630, 8),
    ('2026-08-08', 3, 58.60, 96800, 615, 7),
    ('2026-08-09', 3, 60.00, 99800, 650, 10),
    ('2026-08-10', 3, 59.75, 98900, 638, 9);

-- Campaign 4: Search - Competitors (budget 25, weekend dips)
INSERT INTO daily_metrics (metric_date, campaign_id, spend, impressions, clicks, conversions) VALUES
    ('2026-07-21', 4, 24.50, 5200, 198, 5),
    ('2026-07-22', 4, 25.00, 5350, 205, 6),
    ('2026-07-23', 4, 24.10, 5100, 192, 4),
    ('2026-07-24', 4, 24.85, 5280, 201, 5),
    ('2026-07-25', 4, 17.20, 3700, 138, 3),
    ('2026-07-26', 4, 16.55, 3550, 131, 2),
    ('2026-07-27', 4, 24.95, 5300, 203, 6),
    ('2026-07-28', 4, 25.00, 5400, 208, 6),
    ('2026-07-29', 4, 24.30, 5150, 195, 4),
    ('2026-07-30', 4, 25.00, 5380, 206, 5),
    ('2026-07-31', 4, 24.70, 5250, 200, 5),
    ('2026-08-01', 4, 16.90, 3620, 134, 3),
    ('2026-08-02', 4, 17.45, 3760, 141, 3),
    ('2026-08-03', 4, 25.00, 5420, 210, 6),
    ('2026-08-04', 4, 24.40, 5180, 196, 5),
    ('2026-08-05', 4, 25.00, 5360, 204, 6),
    ('2026-08-06', 4, 24.60, 5220, 199, 4),
    ('2026-08-07', 4, 24.90, 5310, 202, 5),
    ('2026-08-08', 4, 16.70, 3580, 132, 2),
    ('2026-08-09', 4, 17.80, 3820, 144, 3),
    ('2026-08-10', 4, 25.00, 5390, 207, 6);

-- Campaign 5: Search - Generic Wellness (budget 55; bid-war spike Aug 3-4)
INSERT INTO daily_metrics (metric_date, campaign_id, spend, impressions, clicks, conversions) VALUES
    ('2026-07-21', 5, 54.20, 11800, 545, 18),
    ('2026-07-22', 5, 55.00, 12100, 560, 20),
    ('2026-07-23', 5, 53.60, 11600, 534, 17),
    ('2026-07-24', 5, 54.85, 11950, 552, 19),
    ('2026-07-25', 5, 38.10,  8400, 385, 12),
    ('2026-07-26', 5, 36.75,  8100, 371, 11),
    ('2026-07-27', 5, 54.90, 12000, 556, 20),
    ('2026-07-28', 5, 55.00, 12150, 563, 21),
    ('2026-07-29', 5, 54.10, 11750, 542, 18),
    ('2026-07-30', 5, 55.00, 12080, 558, 19),
    ('2026-07-31', 5, 54.55, 11900, 549, 18),
    ('2026-08-01', 5, 37.40,  8250, 377, 11),
    ('2026-08-02', 5, 38.60,  8500, 391, 13),
    ('2026-08-03', 5, 98.75, 19800, 842, 24),
    ('2026-08-04', 5, 104.30, 20900, 869, 22),
    ('2026-08-05', 5, 55.00, 12120, 561, 20),
    ('2026-08-06', 5, 54.35, 11850, 546, 18),
    ('2026-08-07', 5, 54.80, 11980, 554, 19),
    ('2026-08-08', 5, 37.00,  8180, 373, 11),
    ('2026-08-09', 5, 39.10,  8620, 397, 13),
    ('2026-08-10', 5, 55.00, 12100, 559, 20);

-- Campaign 6: Meta - Retargeting (budget 35, strong converter)
INSERT INTO daily_metrics (metric_date, campaign_id, spend, impressions, clicks, conversions) VALUES
    ('2026-07-21', 6, 34.30, 15100, 415, 26),
    ('2026-07-22', 6, 35.00, 15600, 429, 28),
    ('2026-07-23', 6, 33.85, 14800, 405, 24),
    ('2026-07-24', 6, 34.90, 15400, 423, 27),
    ('2026-07-25', 6, 35.00, 15750, 434, 29),
    ('2026-07-26', 6, 34.55, 15300, 420, 26),
    ('2026-07-27', 6, 33.95, 14900, 409, 25),
    ('2026-07-28', 6, 35.00, 15550, 427, 28),
    ('2026-07-29', 6, 34.15, 15000, 412, 25),
    ('2026-07-30', 6, 35.00, 15700, 432, 30),
    ('2026-07-31', 6, 34.70, 15350, 421, 27),
    ('2026-08-01', 6, 35.00, 15800, 436, 30),
    ('2026-08-02', 6, 34.40, 15200, 417, 26),
    ('2026-08-03', 6, 33.70, 14750, 402, 24),
    ('2026-08-04', 6, 35.00, 15650, 430, 29),
    ('2026-08-05', 6, 34.20, 15050, 413, 25),
    ('2026-08-06', 6, 35.00, 15720, 433, 29),
    ('2026-08-07', 6, 34.80, 15420, 424, 28),
    ('2026-08-08', 6, 34.00, 14850, 407, 24),
    ('2026-08-09', 6, 35.00, 15780, 435, 30),
    ('2026-08-10', 6, 34.60, 15280, 419, 27);

-- Campaign 7: Meta - Lookalike Broad (PAUSED Jul 28 - metrics stop)
INSERT INTO daily_metrics (metric_date, campaign_id, spend, impressions, clicks, conversions) VALUES
    ('2026-07-21', 7, 39.20, 21500, 310, 4),
    ('2026-07-22', 7, 40.00, 22100, 322, 5),
    ('2026-07-23', 7, 38.60, 21100, 301, 3),
    ('2026-07-24', 7, 39.85, 21900, 317, 4),
    ('2026-07-25', 7, 40.00, 22300, 326, 5),
    ('2026-07-26', 7, 39.40, 21700, 313, 4),
    ('2026-07-27', 7, 38.90, 21300, 306, 3),
    ('2026-07-28', 7, 39.60, 21800, 315, 4);

-- Campaign 8: Native - Taboola Whitelist (budget 70; conversions NULL Aug 5-7, tracking outage)
INSERT INTO daily_metrics (metric_date, campaign_id, spend, impressions, clicks, conversions) VALUES
    ('2026-07-21', 8, 68.60, 112000, 705, 11),
    ('2026-07-22', 8, 70.00, 115500, 728, 13),
    ('2026-07-23', 8, 67.90, 110800, 692, 10),
    ('2026-07-24', 8, 69.75, 114200, 719, 12),
    ('2026-07-25', 8, 70.00, 116000, 734, 13),
    ('2026-07-26', 8, 69.10, 113600, 713, 11),
    ('2026-07-27', 8, 68.20, 111500, 700, 10),
    ('2026-07-28', 8, 70.00, 115200, 725, 12),
    ('2026-07-29', 8, 68.85, 112800, 709, 11),
    ('2026-07-30', 8, 70.00, 115800, 731, 13),
    ('2026-07-31', 8, 69.40, 114000, 717, 12),
    ('2026-08-01', 8, 70.00, 116300, 737, 14),
    ('2026-08-02', 8, 68.95, 113000, 711, 11),
    ('2026-08-03', 8, 67.75, 110500, 690, 10),
    ('2026-08-04', 8, 70.00, 115600, 729, 13),
    ('2026-08-05', 8, 68.40, 112200, 704, NULL),
    ('2026-08-06', 8, 70.00, 115900, 732, NULL),
    ('2026-08-07', 8, 69.55, 114400, 721, NULL),
    ('2026-08-08', 8, 68.10, 111200, 697, 10),
    ('2026-08-09', 8, 70.00, 116100, 736, 13),
    ('2026-08-10', 8, 69.25, 113800, 715, 12);

-- Campaign 9: Native - Outbrain Test (ENDED Aug 2 - metrics stop)
INSERT INTO daily_metrics (metric_date, campaign_id, spend, impressions, clicks, conversions) VALUES
    ('2026-07-21', 9, 19.60, 33500, 195, 2),
    ('2026-07-22', 9, 20.00, 34400, 202, 3),
    ('2026-07-23', 9, 19.30, 33000, 190, 2),
    ('2026-07-24', 9, 19.90, 34100, 199, 2),
    ('2026-07-25', 9, 20.00, 34600, 205, 3),
    ('2026-07-26', 9, 19.70, 33900, 197, 2),
    ('2026-07-27', 9, 19.45, 33300, 192, 1),
    ('2026-07-28', 9, 20.00, 34300, 201, 3),
    ('2026-07-29', 9, 19.55, 33600, 194, 2),
    ('2026-07-30', 9, 20.00, 34500, 204, 2),
    ('2026-07-31', 9, 19.80, 34000, 198, 2),
    ('2026-08-01', 9, 20.00, 34700, 206, 3),
    ('2026-08-02', 9, 19.65, 33800, 196, 2);

-- Campaign 11: Search - DSA Catchall (launched Aug 10 - one day)
INSERT INTO daily_metrics (metric_date, campaign_id, spend, impressions, clicks, conversions) VALUES
    ('2026-08-10', 11, 14.80, 3900, 162, 4);

-- Campaign 12: Meta - Creator UGC Test (launched Aug 5)
INSERT INTO daily_metrics (metric_date, campaign_id, spend, impressions, clicks, conversions) VALUES
    ('2026-08-05', 12, 24.50, 16800, 298, 6),
    ('2026-08-06', 12, 25.00, 17400, 312, 8),
    ('2026-08-07', 12, 24.70, 17000, 304, 7),
    ('2026-08-08', 12, 24.20, 16600, 293, 6),
    ('2026-08-09', 12, 25.00, 17500, 315, 8),
    ('2026-08-10', 12, 24.85, 17150, 308, 7);

-- Campaign 13: Display - Retargeting Banners (budget 18)
INSERT INTO daily_metrics (metric_date, campaign_id, spend, impressions, clicks, conversions) VALUES
    ('2026-07-21', 13, 17.65, 42000, 128, 6),
    ('2026-07-22', 13, 18.00, 43200, 133, 7),
    ('2026-07-23', 13, 17.30, 41300, 124, 5),
    ('2026-07-24', 13, 17.90, 42800, 131, 6),
    ('2026-07-25', 13, 18.00, 43500, 135, 7),
    ('2026-07-26', 13, 17.70, 42400, 129, 6),
    ('2026-07-27', 13, 17.40, 41600, 125, 5),
    ('2026-07-28', 13, 18.00, 43100, 132, 7),
    ('2026-07-29', 13, 17.55, 41900, 127, 6),
    ('2026-07-30', 13, 18.00, 43400, 134, 7),
    ('2026-07-31', 13, 17.85, 42600, 130, 6),
    ('2026-08-01', 13, 18.00, 43600, 136, 8),
    ('2026-08-02', 13, 17.60, 42100, 128, 6),
    ('2026-08-03', 13, 17.25, 41100, 123, 5),
    ('2026-08-04', 13, 18.00, 43300, 133, 7),
    ('2026-08-05', 13, 17.50, 41800, 126, 6),
    ('2026-08-06', 13, 18.00, 43450, 135, 7),
    ('2026-08-07', 13, 17.80, 42500, 130, 6),
    ('2026-08-08', 13, 17.35, 41400, 124, 5),
    ('2026-08-09', 13, 18.00, 43550, 136, 7),
    ('2026-08-10', 13, 17.75, 42300, 129, 6);
