DROP TABLE IF EXISTS datetimes;
CREATE TABLE datetimes (
    col0 date,
    col1 time,
    col2 timestamp,
    col3 timestamptz,
    col4 interval,
    col5 timetz,
    col0_a date[],
    col1_a time[],
    col2_a timestamp[],
    col3_a timestamptz[],
    col4_a interval[],
    col5_a timetz[],
    col0_nn date NOT NULL,
    col1_nn time NOT NULL,
    col2_nn timestamp NOT NULL,
    col3_nn timestamptz NOT NULL,
    col4_nn interval NOT NULL,
    col5_nn timetz NOT NULL
);

INSERT INTO datetimes (
    col0, col1, col2, col3, col4, col5, 
    col0_a, col1_a, col2_a, col3_a, col4_a, col5_a, 
    col0_nn, col1_nn, col2_nn, col3_nn, col4_nn, col5_nn
) VALUES
    -- Test normal types with valid values
    ('2023-01-01', '12:00:00', '2023-01-01 12:00:00', '2023-01-01 12:00:00+00', '1 day', '12:00:00+00', 
    NULL, NULL, NULL, NULL, NULL, NULL, 
    '2023-01-01', '12:00:00', '2023-01-01 12:00:00', '2023-01-01 12:00:00+00', '1 day', '12:00:00+00'),
    
    -- Test normal types with boundary values
    ('0001-01-01', '00:00:00', '0001-01-01 00:00:00', '0001-01-01 00:00:00+00', '1 second', '00:00:00+00', 
    NULL, NULL, NULL, NULL, NULL, NULL, 
    '0001-01-01', '00:00:00', '0001-01-01 00:00:00', '0001-01-01 00:00:00+00', '1 second', '00:00:00+00'),
    ('9999-12-31', '23:59:59', '9999-12-31 23:59:59', '9999-12-31 23:59:59+00', '1 year', '23:59:59+00', 
    NULL, NULL, NULL, NULL, NULL, NULL, 
    '9999-12-31', '23:59:59', '9999-12-31 23:59:59', '9999-12-31 23:59:59+00', '1 year', '23:59:59+00'),
    
    -- Test arrays with valid values
    (NULL, NULL, NULL, NULL, NULL, NULL, 
    '{"2023-01-01", "2023-01-02"}', '{"12:00:00", "13:00:00"}', '{"2023-01-01 12:00:00", "2023-01-02 12:00:00"}', '{"2023-01-01 12:00:00+00", "2023-01-02 12:00:00+00"}', '{"1 day", "2 days"}', '{"12:00:00+00", "13:00:00+00"}', 
    '2023-01-01', '12:00:00', '2023-01-01 12:00:00', '2023-01-01 12:00:00+00', '1 day', '12:00:00+00'),
    
    -- Test multi-dimensional arrays
    (NULL, NULL, NULL, NULL, NULL, NULL, 
    '{{"2023-01-01", "2023-01-02"}, {"2023-01-03", "2023-01-04"}}', '{{"12:00:00", "13:00:00"}, {"14:00:00", "15:00:00"}}', '{{"2023-01-01 12:00:00", "2023-01-02 12:00:00"}, {"2023-01-03 12:00:00", "2023-01-04 12:00:00"}}', '{{"2023-01-01 12:00:00+00", "2023-01-02 12:00:00+00"}, {"2023-01-03 12:00:00+00", "2023-01-04 12:00:00+00"}}', '{{"1 day", "2 days"}, {"3 days", "4 days"}}', '{{"12:00:00+00", "13:00:00+00"}, {"14:00:00+00", "15:00:00+00"}}', 
    '2023-01-01', '12:00:00', '2023-01-01 12:00:00', '2023-01-01 12:00:00+00', '1 day', '12:00:00+00'),
    
    -- Test nullable types with NULL values
    (NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, 
    '2023-01-01', '12:00:00', '2023-01-01 12:00:00', '2023-01-01 12:00:00+00', '1 day', '12:00:00+00'),
    
    -- Test mix of NULL and non-NULL values
    ('2023-01-01', NULL, '2023-01-01 12:00:00', NULL, '1 day', NULL, 
    '{"2023-01-01", NULL}', '{"12:00:00", NULL}', '{"2023-01-01 12:00:00", NULL}', '{"2023-01-01 12:00:00+00", NULL}', '{"1 day", NULL}', '{"12:00:00+00", NULL}', 
    '2023-01-01', '12:00:00', '2023-01-01 12:00:00', '2023-01-01 12:00:00+00', '1 day', '12:00:00+00'),
    
    -- Test timezone handling
    ('2023-01-01', '12:00:00', '2023-01-01 12:00:00', '2023-01-01 12:00:00+05', '1 day', '12:00:00+05', 
    NULL, NULL, NULL, NULL, NULL, NULL, 
    '2023-01-01', '12:00:00', '2023-01-01 12:00:00', '2023-01-01 12:00:00+05', '1 day', '12:00:00+05'),
    ('2023-01-01', '12:00:00', '2023-01-01 12:00:00', '2023-01-01 12:00:00-05', '1 day', '12:00:00-05', 
    NULL, NULL, NULL, NULL, NULL, NULL, 
    '2023-01-01', '12:00:00', '2023-01-01 12:00:00', '2023-01-01 12:00:00-05', '1 day', '12:00:00-05');