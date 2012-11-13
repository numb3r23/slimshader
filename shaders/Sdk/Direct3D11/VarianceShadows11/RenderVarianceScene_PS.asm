//
// Generated by Microsoft (R) HLSL Shader Compiler 9.30.9200.16384
//
//
///
// Buffer Definitions: 
//
// cbuffer cbAllShadowData
// {
//
//   float4x4 m_mWorldViewProjection;   // Offset:    0 Size:    64 [unused]
//   float4x4 m_mWorld;                 // Offset:   64 Size:    64 [unused]
//   float4x4 m_mWorldView;             // Offset:  128 Size:    64 [unused]
//   float4x4 m_mShadow;                // Offset:  192 Size:    64 [unused]
//   float4 m_vCascadeOffset[8];        // Offset:  256 Size:   128
//   float4 m_vCascadeScale[8];         // Offset:  384 Size:   128
//   int m_nCascadeLevels;              // Offset:  512 Size:     4 [unused]
//   int m_iVisualizeCascades;          // Offset:  516 Size:     4
//   float m_fMinBorderPadding;         // Offset:  520 Size:     4
//   float m_fMaxBorderPadding;         // Offset:  524 Size:     4
//   float m_fCascadeBlendArea;         // Offset:  528 Size:     4 [unused]
//   float m_fTexelSize;                // Offset:  532 Size:     4 [unused]
//   float m_fNativeTexelSizeInX;       // Offset:  536 Size:     4 [unused]
//   float4 m_fCascadeFrustumsEyeSpaceDepthsData[2];// Offset:  544 Size:    32 [unused]
//   float3 m_vLightDir;                // Offset:  576 Size:    12
//   float m_fPaddingCB4;               // Offset:  588 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// g_samLinear                       sampler      NA          NA    0        1
// g_samShadow                       sampler      NA          NA    5        1
// g_txDiffuse                       texture  float4          2d    0        1
// g_txShadow                        texture  float4     2darray    5        1
// cbAllShadowData                   cbuffer      NA          NA    0        1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// NORMAL                   0   xyz         0     NONE   float   xyz 
// COLOR                    0   xy          1     NONE   float   xy  
// TEXCOORD                 3     z         1     NONE   float       
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// SV_POSITION              0   xyzw        3      POS   float       
// TEXCOORD                 2   xyzw        4     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_TARGET                0   xyzw        0   TARGET   float   xyzw
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_immediateConstantBuffer { { 1.500000, 0, 0, 1.000000},
                              { 0, 1.500000, 0, 1.000000},
                              { 0, 0, 5.500000, 1.000000},
                              { 1.500000, 0, 5.500000, 1.000000},
                              { 1.500000, 1.500000, 0, 1.000000},
                              { 1.000000, 1.000000, 1.000000, 1.000000},
                              { 0, 1.000000, 5.500000, 1.000000},
                              { 0.500000, 3.500000, 0.750000, 1.000000} }
dcl_constantbuffer cb0[37], dynamicIndexed
dcl_sampler s0, mode_default
dcl_sampler s5, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2darray (float,float,float,float) t5
dcl_input_ps linear v0.xyz
dcl_input_ps linear v1.xy
dcl_input_ps linear v2.xyz
dcl_output o0.xyzw
dcl_temps 4
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t0.xyzw, s0
mov r1.x, l(1)
mov r2.xyz, l(0,0,0,0)
mov r3.xy, l(0,0,0,0)
mov r1.y, l(0)
loop 
  ilt r1.z, r1.y, l(3)
  ieq r1.w, r3.x, l(0)
  and r1.z, r1.w, r1.z
  breakc_z r1.z
  mad r2.xyz, v2.xyzx, cb0[r1.y + 24].xyzx, cb0[r1.y + 16].xyzx
  min r1.z, r2.y, r2.x
  lt r1.z, cb0[32].z, r1.z
  max r1.w, r2.y, r2.x
  lt r1.w, r1.w, cb0[32].w
  and r1.z, r1.w, r1.z
  movc r3.xy, r1.zzzz, r1.xyxx, r3.xyxx
  iadd r1.y, r1.y, l(1)
endloop 
itof r2.w, r3.y
deriv_rtx_coarse r1.xyz, v2.xyxx
mul r1.xyz, r1.xyzx, cb0[r3.y + 24].xyxx
deriv_rty_coarse r3.xzw, v2.xxyx
mul r3.xzw, r3.xxzw, cb0[r3.y + 24].xxyx
sample_d_indexable(texture2darray)(float,float,float,float) r1.xy, r2.xywx, t5.xyzw, s5, r1.xyzx, r3.xzwx
ge r1.z, r1.x, r2.z
mad r1.y, -r1.x, r1.x, r1.y
add_sat r1.y, r1.y, l(0.000010)
add r1.x, -r1.x, r2.z
mad r1.x, r1.x, r1.x, r1.y
div r1.x, r1.y, r1.x
mul r1.x, r1.x, r1.x
mul r1.x, r1.x, r1.x
movc r1.x, r1.z, l(1.000000), r1.x
mov r2.xyz, icb[r3.y + 0].xyzx
mov r2.w, l(1.000000)
movc r2.xyzw, cb0[32].yyyy, r2.xyzw, l(1.000000,1.000000,1.000000,1.000000)
dp3_sat r1.y, l(-1.000000, 1.000000, -1.000000, 0.000000), v0.xyzx
dp3_sat r1.z, l(1.000000, 1.000000, -1.000000, 0.000000), v0.xyzx
mul r1.z, r1.z, l(0.050000)
mad r1.y, r1.y, l(0.050000), r1.z
mov_sat r1.z, -v0.y
mad r1.y, r1.z, l(0.050000), r1.y
dp3_sat r1.z, l(1.000000, 1.000000, 1.000000, 0.000000), v0.xyzx
mad r1.y, r1.z, l(0.050000), r1.y
mul r1.z, r1.y, l(0.500000)
dp3_sat r1.w, cb0[36].xyzx, v0.xyzx
add r1.w, r1.w, r1.y
mad r1.y, -r1.y, l(0.500000), r1.w
mad r1.x, r1.x, r1.y, r1.z
mul r1.xyzw, r2.xyzw, r1.xxxx
mul o0.xyzw, r0.xyzw, r1.xyzw
ret 
// Approximately 53 instruction slots used