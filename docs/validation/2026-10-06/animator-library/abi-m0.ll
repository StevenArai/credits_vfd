; ModuleID = 'tools/profile_abi.c'
source_filename = "tools/profile_abi.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv6m-unknown-none-eabi"

@size_Credits = dso_local constant i32 30664, align 4
@size_Canvas = dso_local constant i32 4812, align 4
@size_WordLine = dso_local constant i32 12, align 4
@size_HistoryEntry = dso_local constant i32 12, align 4
@size_Text = dso_local constant i32 20, align 4
@size_Random = dso_local constant i32 2512, align 4
@size_Ocean = dso_local constant i32 496, align 4
@size_Weather = dso_local constant i32 56, align 4
@size_Layout60 = dso_local constant i32 4804, align 4
@size_Framebuffer = dso_local constant i32 4096, align 4
@size_FixedPlayer = dso_local constant i32 72, align 4
@size_CreditsAnimator = dso_local constant i32 34872, align 4

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"min_enum_size", i32 4}
!1 = !{i32 4, !"arm-eabi-fp-denormal", i32 1}
!2 = !{i32 8, !"arm-eabi-fp-number-model", i32 3}
!3 = !{!"clang version 23.1.2 (https://github.com/llvm/llvm-project.git 85ac560262434c9ccfc0c183ec22d4138ed647fb)"}
