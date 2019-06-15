param n, integer, >= 1;

set V, default {0..n-1};

set E, within V cross V;

param capacity{(i,j) in E}, >= 0;

param source, symbolic, in V, default 0;

param sink, symbolic, in V, != source, default n-1;

var flow{(i,j) in E}, >= 0, <= capacity[i,j];

var maxFlow, >= 0;

s.t. condition_1{i in V: i<>source and i<>sink}:
   sum{(j,i) in E} flow[j,i] = sum{(i,j) in E} flow[i,j];
   
s.t. condition_2{i in V: i=source}:
   maxFlow = sum{(i,j) in E} flow[i,j];
   
s.t. condition_3{i in V: i=sink}:
   maxFlow = sum{(j,i) in E} flow[j,i] ;

maximize obj: maxFlow;

solve;

printf "Maximum flow: %s\n", maxFlow;

data;param n := 128;
param : E :   capacity :=
0 1 126
0 2 31
0 4 120
0 8 44
0 16 115
0 32 30
0 64 60
1 3 55
1 5 9
1 9 12
1 17 1
1 33 48
1 65 46
2 3 46
2 6 15
2 10 55
2 18 33
2 34 50
2 66 8
3 7 15
3 11 20
3 19 16
3 35 32
3 67 1
4 5 50
4 6 27
4 12 48
4 20 17
4 36 47
4 68 33
5 7 25
5 13 14
5 21 17
5 37 18
5 69 22
6 7 31
6 14 3
6 22 7
6 38 29
6 70 11
7 15 3
7 23 8
7 39 2
7 71 10
8 9 2
8 10 27
8 12 38
8 24 37
8 40 62
8 72 5
9 11 20
9 13 19
9 25 13
9 41 23
9 73 2
10 11 32
10 14 14
10 26 29
10 42 5
10 74 7
11 15 10
11 27 15
11 43 5
11 75 4
12 13 16
12 14 7
12 28 20
12 44 17
12 76 25
13 15 9
13 29 5
13 45 4
13 77 11
14 15 14
14 30 8
14 46 16
14 78 5
15 31 24
15 47 17
15 79 21
16 17 1
16 18 13
16 20 41
16 24 27
16 48 54
16 80 30
17 19 4
17 21 6
17 25 13
17 49 9
17 81 13
18 19 9
18 22 5
18 26 4
18 50 16
18 82 32
19 23 8
19 27 13
19 51 9
19 83 8
20 21 27
20 22 12
20 28 26
20 52 2
20 84 27
21 23 7
21 29 13
21 53 11
21 85 10
22 23 15
22 30 16
22 54 6
22 86 10
23 31 4
23 55 11
23 87 26
24 25 2
24 26 14
24 28 29
24 56 30
24 88 1
25 27 15
25 29 5
25 57 8
25 89 10
26 27 10
26 30 12
26 58 13
26 90 3
27 31 19
27 59 25
27 91 16
28 29 1
28 30 12
28 60 8
28 92 14
29 31 21
29 61 4
29 93 19
30 31 17
30 62 17
30 94 25
31 63 37
31 95 64
32 33 49
32 34 54
32 36 52
32 40 3
32 48 23
32 96 37
33 35 30
33 37 32
33 41 19
33 49 1
33 97 31
34 35 9
34 38 25
34 42 11
34 50 18
34 98 3
35 39 11
35 43 2
35 51 14
35 99 3
36 37 26
36 38 20
36 44 13
36 52 26
36 100 10
37 39 16
37 45 15
37 53 8
37 101 11
38 39 9
38 46 15
38 54 2
38 102 15
39 47 16
39 55 22
39 103 12
40 41 4
40 42 31
40 44 26
40 56 8
40 104 30
41 43 7
41 45 1
41 57 7
41 105 11
42 43 10
42 46 3
42 58 10
42 106 1
43 47 9
43 59 32
43 107 5
44 45 8
44 46 8
44 60 1
44 108 3
45 47 17
45 61 11
45 109 16
46 47 25
46 62 21
46 110 25
47 63 64
47 111 27
48 49 14
48 50 2
48 52 27
48 56 15
48 112 8
49 51 5
49 53 2
49 57 15
49 113 10
50 51 1
50 54 1
50 58 9
50 114 11
51 55 26
51 59 9
51 115 6
52 53 5
52 54 15
52 60 14
52 116 3
53 55 16
53 61 8
53 117 14
54 55 2
54 62 32
54 118 15
55 63 22
55 119 32
56 57 8
56 58 6
56 60 12
56 120 16
57 59 30
57 61 8
57 121 12
58 59 9
58 62 27
58 122 7
59 63 43
59 123 52
60 61 1
60 62 21
60 124 11
61 63 15
61 125 53
62 63 30
62 126 7
63 127 77
64 65 39
64 66 48
64 68 53
64 72 51
64 80 20
64 96 57
65 67 2
65 69 5
65 73 24
65 81 26
65 97 30
66 67 16
66 70 20
66 74 24
66 82 15
66 98 26
67 71 14
67 75 7
67 83 11
67 99 3
68 69 23
68 70 23
68 76 19
68 84 8
68 100 24
69 71 13
69 77 2
69 85 16
69 101 12
70 71 12
70 78 10
70 86 12
70 102 13
71 79 29
71 87 23
71 103 3
72 73 23
72 74 16
72 76 19
72 88 20
72 104 16
73 75 14
73 77 12
73 89 13
73 105 9
74 75 6
74 78 5
74 90 1
74 106 1
75 79 30
75 91 2
75 107 5
76 77 4
76 78 1
76 92 16
76 108 11
77 79 23
77 93 6
77 109 6
78 79 1
78 94 2
78 110 24
79 95 34
79 111 54
80 81 29
80 82 21
80 84 29
80 88 25
80 112 21
81 83 3
81 85 3
81 89 14
81 113 7
82 83 8
82 86 3
82 90 13
82 114 6
83 87 15
83 91 3
83 115 9
84 85 15
84 86 16
84 92 16
84 116 1
85 87 22
85 93 18
85 117 6
86 87 9
86 94 22
86 118 18
87 95 5
87 119 23
88 89 2
88 90 1
88 92 11
88 120 7
89 91 31
89 93 3
89 121 25
90 91 14
90 94 8
90 122 7
91 95 61
91 123 60
92 93 5
92 94 31
92 124 9
93 95 60
93 125 37
94 95 45
94 126 11
95 127 89
96 97 13
96 98 29
96 100 4
96 104 1
96 112 3
97 99 12
97 101 13
97 105 4
97 113 9
98 99 9
98 102 10
98 106 13
98 114 4
99 103 4
99 107 23
99 115 12
100 101 9
100 102 14
100 108 9
100 116 11
101 103 1
101 109 1
101 117 22
102 103 6
102 110 8
102 118 3
103 111 13
103 119 16
104 105 6
104 106 5
104 108 16
104 120 10
105 107 30
105 109 32
105 121 30
106 107 17
106 110 25
106 122 25
107 111 24
107 123 58
108 109 12
108 110 14
108 124 7
109 111 14
109 125 37
110 111 54
110 126 29
111 127 117
112 113 5
112 114 3
112 116 6
112 120 13
113 115 5
113 117 23
113 121 27
114 115 22
114 118 16
114 122 8
115 119 18
115 123 48
116 117 28
116 118 16
116 124 25
117 119 56
117 125 51
118 119 47
118 126 45
119 127 41
120 121 13
120 122 7
120 124 18
121 123 43
121 125 23
122 123 7
122 126 47
123 127 101
124 125 58
124 126 60
125 127 36
126 127 23
;
end;