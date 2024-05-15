-- Load input file from HDFS
inputFile = LOAD 'hdfs:///user/Prema/testfile.txt' AS (line:chararray);
-- Tokeize each word in the file (Map)
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
-- Group words by word(MAP)
grpd = GROUP words BY word;
-- Count the number of  words (Reduce)
totalCount = FOREACH grpd GENERATE $0, COUNT($1);
-- Store the result in HDFS
rmf hdfs:///user/Prema/PigOutput1
STORE totalCount INTO 'hdfs:///user/Prema/PiOutput1';