-- Load input file from HDFS
inputFile = LOAD 'hdfs:///user/Prema/episodeIV_dialogues.txt'
inputFile1 = LOAD 'hdfs:///user/Prema/episodeV_dialogues.txt'
inputFile1 = LOAD 'hdfs:///user/Prema/episodeVI_dialogues.txt'
-- Tokeize each word in the file (Map)
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
-- Group words by word(MAP)
grpd = GROUP words BY word;
-- Count the number of  words (Reduce)
totalCount = FOREACH grpd GENERATE $0, COUNT($1);
-- Store the result in HDFS
rmf hdfs:///user/Prema/Pigprojectactivity1
STORE totalCount INTO 'hdfs:///user/Prema/PigprojectOutput1';