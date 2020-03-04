param n, integer, >= 1; #

set V, default {0..n-1}; #

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

data;
param n := 258;
param : E :   capacity :=
0 1 1
0 2 1
0 3 1
0 4 1
0 5 1
0 6 1
0 7 1
0 8 1
0 9 1
0 10 1
0 11 1
0 12 1
0 13 1
0 14 1
0 15 1
0 16 1
0 17 1
0 18 1
0 19 1
0 20 1
0 21 1
0 22 1
0 23 1
0 24 1
0 25 1
0 26 1
0 27 1
0 28 1
0 29 1
0 30 1
0 31 1
0 32 1
0 33 1
0 34 1
0 35 1
0 36 1
0 37 1
0 38 1
0 39 1
0 40 1
0 41 1
0 42 1
0 43 1
0 44 1
0 45 1
0 46 1
0 47 1
0 48 1
0 49 1
0 50 1
0 51 1
0 52 1
0 53 1
0 54 1
0 55 1
0 56 1
0 57 1
0 58 1
0 59 1
0 60 1
0 61 1
0 62 1
0 63 1
0 64 1
0 65 1
0 66 1
0 67 1
0 68 1
0 69 1
0 70 1
0 71 1
0 72 1
0 73 1
0 74 1
0 75 1
0 76 1
0 77 1
0 78 1
0 79 1
0 80 1
0 81 1
0 82 1
0 83 1
0 84 1
0 85 1
0 86 1
0 87 1
0 88 1
0 89 1
0 90 1
0 91 1
0 92 1
0 93 1
0 94 1
0 95 1
0 96 1
0 97 1
0 98 1
0 99 1
0 100 1
0 101 1
0 102 1
0 103 1
0 104 1
0 105 1
0 106 1
0 107 1
0 108 1
0 109 1
0 110 1
0 111 1
0 112 1
0 113 1
0 114 1
0 115 1
0 116 1
0 117 1
0 118 1
0 119 1
0 120 1
0 121 1
0 122 1
0 123 1
0 124 1
0 125 1
0 126 1
0 127 1
0 128 1
1 184 1
2 200 1
3 135 1
4 178 1
5 171 1
6 143 1
7 246 1
8 232 1
9 217 1
10 181 1
11 232 1
12 168 1
13 216 1
14 135 1
15 205 1
16 229 1
17 225 1
18 214 1
19 176 1
20 230 1
21 149 1
22 139 1
23 185 1
24 156 1
25 177 1
26 176 1
27 177 1
28 194 1
29 167 1
30 202 1
31 173 1
32 246 1
33 196 1
34 235 1
35 222 1
36 249 1
37 176 1
38 165 1
39 191 1
40 227 1
41 229 1
42 140 1
43 213 1
44 171 1
45 186 1
46 171 1
47 199 1
48 217 1
49 182 1
50 209 1
51 199 1
52 132 1
53 241 1
54 141 1
55 192 1
56 238 1
57 171 1
58 221 1
59 244 1
60 177 1
61 188 1
62 160 1
63 247 1
64 254 1
65 234 1
66 252 1
67 254 1
68 213 1
69 244 1
70 231 1
71 228 1
72 150 1
73 219 1
74 143 1
75 166 1
76 191 1
77 239 1
78 242 1
79 134 1
80 156 1
81 181 1
82 214 1
83 133 1
84 170 1
85 209 1
86 187 1
87 252 1
88 185 1
89 233 1
90 239 1
91 199 1
92 188 1
93 245 1
94 131 1
95 189 1
96 158 1
97 238 1
98 254 1
99 160 1
100 166 1
101 169 1
102 250 1
103 214 1
104 228 1
105 238 1
106 213 1
107 183 1
108 143 1
109 193 1
110 159 1
111 170 1
112 141 1
113 195 1
114 178 1
115 170 1
116 153 1
117 224 1
118 248 1
119 250 1
120 186 1
121 135 1
122 180 1
123 194 1
124 148 1
125 236 1
126 220 1
127 171 1
128 201 1
129 257 1
130 257 1
131 257 1
132 257 1
133 257 1
134 257 1
135 257 1
136 257 1
137 257 1
138 257 1
139 257 1
140 257 1
141 257 1
142 257 1
143 257 1
144 257 1
145 257 1
146 257 1
147 257 1
148 257 1
149 257 1
150 257 1
151 257 1
152 257 1
153 257 1
154 257 1
155 257 1
156 257 1
157 257 1
158 257 1
159 257 1
160 257 1
161 257 1
162 257 1
163 257 1
164 257 1
165 257 1
166 257 1
167 257 1
168 257 1
169 257 1
170 257 1
171 257 1
172 257 1
173 257 1
174 257 1
175 257 1
176 257 1
177 257 1
178 257 1
179 257 1
180 257 1
181 257 1
182 257 1
183 257 1
184 257 1
185 257 1
186 257 1
187 257 1
188 257 1
189 257 1
190 257 1
191 257 1
192 257 1
193 257 1
194 257 1
195 257 1
196 257 1
197 257 1
198 257 1
199 257 1
200 257 1
201 257 1
202 257 1
203 257 1
204 257 1
205 257 1
206 257 1
207 257 1
208 257 1
209 257 1
210 257 1
211 257 1
212 257 1
213 257 1
214 257 1
215 257 1
216 257 1
217 257 1
218 257 1
219 257 1
220 257 1
221 257 1
222 257 1
223 257 1
224 257 1
225 257 1
226 257 1
227 257 1
228 257 1
229 257 1
230 257 1
231 257 1
232 257 1
233 257 1
234 257 1
235 257 1
236 257 1
237 257 1
238 257 1
239 257 1
240 257 1
241 257 1
242 257 1
243 257 1
244 257 1
245 257 1
246 257 1
247 257 1
248 257 1
249 257 1
250 257 1
251 257 1
252 257 1
253 257 1
254 257 1
255 257 1
256 257 1
;
end;