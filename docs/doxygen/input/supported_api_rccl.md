# RCCL API Support

\# | API Name | Variants
----|---------------|---------
1 | [ncclMemAlloc](interfacehipfort__rccl_1_1ncclmemalloc.html "Interface documentation") | C binding
2 | [ncclMemFree](interfacehipfort__rccl_1_1ncclmemfree.html "Interface documentation") | C binding
3 | [ncclGetVersion](interfacehipfort__rccl_1_1ncclgetversion.html "Interface documentation") | C binding, typed
4 | [ncclGetUniqueId](interfacehipfort__rccl_1_1ncclgetuniqueid.html "Interface documentation") | C binding
5 | [ncclCommInitRankConfig](interfacehipfort__rccl_1_1ncclcomminitrankconfig.html "Interface documentation") | C binding
6 | [ncclCommInitRank](interfacehipfort__rccl_1_1ncclcomminitrank.html "Interface documentation") | C binding
7 | [ncclCommInitAll](interfacehipfort__rccl_1_1ncclcomminitall.html "Interface documentation") | C binding, rank_0, rank_1, assumed_rank
8 | [ncclCommFinalize](interfacehipfort__rccl_1_1ncclcommfinalize.html "Interface documentation") | C binding
9 | [ncclCommDestroy](interfacehipfort__rccl_1_1ncclcommdestroy.html "Interface documentation") | C binding
10 | [ncclCommAbort](interfacehipfort__rccl_1_1ncclcommabort.html "Interface documentation") | C binding
11 | [ncclCommRevoke](interfacehipfort__rccl_1_1ncclcommrevoke.html "Interface documentation") | C binding
12 | [ncclCommSplit](interfacehipfort__rccl_1_1ncclcommsplit.html "Interface documentation") | C binding
13 | [ncclCommShrink](interfacehipfort__rccl_1_1ncclcommshrink.html "Interface documentation") | C binding, rank_0, rank_1, assumed_rank
14 | [ncclCommGetUniqueId](interfacehipfort__rccl_1_1ncclcommgetuniqueid.html "Interface documentation") | C binding
15 | [ncclCommGrow](interfacehipfort__rccl_1_1ncclcommgrow.html "Interface documentation") | C binding
16 | [ncclCommInitRankScalable](interfacehipfort__rccl_1_1ncclcomminitrankscalable.html "Interface documentation") | C binding
17 | [ncclGetErrorString](interfacehipfort__rccl_1_1ncclgeterrorstring.html "Interface documentation") | C binding
18 | [ncclGetLastError](interfacehipfort__rccl_1_1ncclgetlasterror.html "Interface documentation") | C binding
19 | [ncclResetDebugInit](interfacehipfort__rccl_1_1ncclresetdebuginit.html "Interface documentation") | C binding
20 | [ncclCommGetAsyncError](interfacehipfort__rccl_1_1ncclcommgetasyncerror.html "Interface documentation") | C binding, typed
21 | [ncclCommCount](interfacehipfort__rccl_1_1ncclcommcount.html "Interface documentation") | C binding, typed
22 | [ncclCommCuDevice](interfacehipfort__rccl_1_1ncclcommcudevice.html "Interface documentation") | C binding, typed
23 | [ncclCommUserRank](interfacehipfort__rccl_1_1ncclcommuserrank.html "Interface documentation") | C binding, typed
24 | [ncclCommRegister](interfacehipfort__rccl_1_1ncclcommregister.html "Interface documentation") | C binding
25 | [ncclCommDeregister](interfacehipfort__rccl_1_1ncclcommderegister.html "Interface documentation") | C binding
26 | [ncclCommSuspend](interfacehipfort__rccl_1_1ncclcommsuspend.html "Interface documentation") | C binding
27 | [ncclCommResume](interfacehipfort__rccl_1_1ncclcommresume.html "Interface documentation") | C binding
28 | [ncclCommMemStats](interfacehipfort__rccl_1_1ncclcommmemstats.html "Interface documentation") | C binding, typed
29 | [ncclCommWindowRegister](interfacehipfort__rccl_1_1ncclcommwindowregister.html "Interface documentation") | C binding
30 | [ncclCommWindowDeregister](interfacehipfort__rccl_1_1ncclcommwindowderegister.html "Interface documentation") | C binding
31 | [ncclWinGetUserPtr](interfacehipfort__rccl_1_1ncclwingetuserptr.html "Interface documentation") | C binding
32 | [ncclRedOpCreatePreMulSum](interfacehipfort__rccl_1_1ncclredopcreatepremulsum.html "Interface documentation") | C binding, typed
33 | [ncclRedOpDestroy](interfacehipfort__rccl_1_1ncclredopdestroy.html "Interface documentation") | C binding
34 | [ncclReduce](interfacehipfort__rccl_1_1ncclreduce.html "Interface documentation") | C binding
35 | [ncclBcast](interfacehipfort__rccl_1_1ncclbcast.html "Interface documentation") | C binding
36 | [ncclBroadcast](interfacehipfort__rccl_1_1ncclbroadcast.html "Interface documentation") | C binding
37 | [ncclAllReduce](interfacehipfort__rccl_1_1ncclallreduce.html "Interface documentation") | C binding
38 | [ncclAllReduceWithBias](interfacehipfort__rccl_1_1ncclallreducewithbias.html "Interface documentation") | C binding
39 | [ncclReduceScatter](interfacehipfort__rccl_1_1ncclreducescatter.html "Interface documentation") | C binding
40 | [ncclAllGather](interfacehipfort__rccl_1_1ncclallgather.html "Interface documentation") | C binding
41 | [ncclAlltoAll](interfacehipfort__rccl_1_1ncclalltoall.html "Interface documentation") | C binding
42 | [ncclAlltoAllv](interfacehipfort__rccl_1_1ncclalltoallv.html "Interface documentation") | C binding, rank_0, rank_1, assumed_rank
43 | [ncclGather](interfacehipfort__rccl_1_1ncclgather.html "Interface documentation") | C binding
44 | [ncclScatter](interfacehipfort__rccl_1_1ncclscatter.html "Interface documentation") | C binding
45 | [ncclAllReduceConfig](interfacehipfort__rccl_1_1ncclallreduceconfig.html "Interface documentation") | C binding
46 | [ncclBroadcastConfig](interfacehipfort__rccl_1_1ncclbroadcastconfig.html "Interface documentation") | C binding
47 | [ncclReduceConfig](interfacehipfort__rccl_1_1ncclreduceconfig.html "Interface documentation") | C binding
48 | [ncclAllGatherConfig](interfacehipfort__rccl_1_1ncclallgatherconfig.html "Interface documentation") | C binding
49 | [ncclReduceScatterConfig](interfacehipfort__rccl_1_1ncclreducescatterconfig.html "Interface documentation") | C binding
50 | [ncclAlltoAllConfig](interfacehipfort__rccl_1_1ncclalltoallconfig.html "Interface documentation") | C binding
51 | [ncclGatherConfig](interfacehipfort__rccl_1_1ncclgatherconfig.html "Interface documentation") | C binding
52 | [ncclScatterConfig](interfacehipfort__rccl_1_1ncclscatterconfig.html "Interface documentation") | C binding
53 | [ncclSend](interfacehipfort__rccl_1_1ncclsend.html "Interface documentation") | C binding
54 | [ncclRecv](interfacehipfort__rccl_1_1ncclrecv.html "Interface documentation") | C binding
55 | [ncclPutSignal](interfacehipfort__rccl_1_1ncclputsignal.html "Interface documentation") | C binding
56 | [ncclSignal](interfacehipfort__rccl_1_1ncclsignal.html "Interface documentation") | C binding
57 | [ncclWaitSignal](interfacehipfort__rccl_1_1ncclwaitsignal.html "Interface documentation") | C binding
58 | [ncclGroupStart](interfacehipfort__rccl_1_1ncclgroupstart.html "Interface documentation") | C binding
59 | [ncclGroupEnd](interfacehipfort__rccl_1_1ncclgroupend.html "Interface documentation") | C binding
60 | [ncclGroupSimulateEnd](interfacehipfort__rccl_1_1ncclgroupsimulateend.html "Interface documentation") | C binding
61 | [ncclSetEncryption](interfacehipfort__rccl_1_1ncclsetencryption.html "Interface documentation") | C binding
62 | [ncclParamBind](interfacehipfort__rccl_1_1ncclparambind.html "Interface documentation") | C binding
63 | [ncclParamGetI8](interfacehipfort__rccl_1_1ncclparamgeti8.html "Interface documentation") | C binding, typed
64 | [ncclParamGetI16](interfacehipfort__rccl_1_1ncclparamgeti16.html "Interface documentation") | C binding, typed
65 | [ncclParamGetI32](interfacehipfort__rccl_1_1ncclparamgeti32.html "Interface documentation") | C binding, typed
66 | [ncclParamGetI64](interfacehipfort__rccl_1_1ncclparamgeti64.html "Interface documentation") | C binding, typed
67 | [ncclParamGetU8](interfacehipfort__rccl_1_1ncclparamgetu8.html "Interface documentation") | C binding, typed
68 | [ncclParamGetU16](interfacehipfort__rccl_1_1ncclparamgetu16.html "Interface documentation") | C binding, typed
69 | [ncclParamGetU32](interfacehipfort__rccl_1_1ncclparamgetu32.html "Interface documentation") | C binding, typed
70 | [ncclParamGetU64](interfacehipfort__rccl_1_1ncclparamgetu64.html "Interface documentation") | C binding, typed
71 | [ncclParamGetStr](interfacehipfort__rccl_1_1ncclparamgetstr.html "Interface documentation") | C binding
72 | [ncclParamGet](interfacehipfort__rccl_1_1ncclparamget.html "Interface documentation") | C binding, typed
73 | [ncclParamGetParameter](interfacehipfort__rccl_1_1ncclparamgetparameter.html "Interface documentation") | C binding, typed
74 | [ncclParamGetAllParameterKeys](interfacehipfort__rccl_1_1ncclparamgetallparameterkeys.html "Interface documentation") | C binding, typed
75 | [ncclParamDumpAll](interfacehipfort__rccl_1_1ncclparamdumpall.html "Interface documentation") | C binding
