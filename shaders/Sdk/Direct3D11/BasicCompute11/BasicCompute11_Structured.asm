//
// Generated by Microsoft (R) HLSL Shader Compiler 9.30.9200.16384
//
//
///
// Buffer Definitions: 
//
// Resource bind info for Buffer0
// {
//
//   struct BufType
//   {
//       
//       int i;                         // Offset:    0
//       float f;                       // Offset:    4
//
//   } $Element;                        // Offset:    0 Size:     8
//
// }
//
// Resource bind info for Buffer1
// {
//
//   struct BufType
//   {
//       
//       int i;                         // Offset:    0
//       float f;                       // Offset:    4
//
//   } $Element;                        // Offset:    0 Size:     8
//
// }
//
// Resource bind info for BufferOut
// {
//
//   struct BufType
//   {
//       
//       int i;                         // Offset:    0
//       float f;                       // Offset:    4
//
//   } $Element;                        // Offset:    0 Size:     8
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// Buffer0                           texture  struct         r/o    0        1
// Buffer1                           texture  struct         r/o    1        1
// BufferOut                             UAV  struct         r/w    0        1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// no Input
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// no Output
cs_5_0
dcl_globalFlags refactoringAllowed
dcl_resource_structured t0, 8 
dcl_resource_structured t1, 8 
dcl_uav_structured u0, 8
dcl_input vThreadID.x
dcl_temps 2
dcl_thread_group 1, 1, 1
ld_structured_indexable(structured_buffer, stride=8)(mixed,mixed,mixed,mixed) r0.xy, vThreadID.x, l(0), t0.xyxx
ld_structured_indexable(structured_buffer, stride=8)(mixed,mixed,mixed,mixed) r0.zw, vThreadID.x, l(0), t1.xxxy
iadd r1.x, r0.z, r0.x
add r1.y, r0.w, r0.y
store_structured u0.xy, vThreadID.x, l(0), r1.xyxx
ret 
// Approximately 6 instruction slots used
