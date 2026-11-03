; ModuleID = 'compressed_assemblies.x86_64.ll'
source_filename = "compressed_assemblies.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.CompressedAssemblyDescriptor = type {
	i32, ; uint32_t uncompressed_file_size
	i1, ; bool loaded
	i32 ; uint32_t buffer_offset
}

@compressed_assembly_count = dso_local local_unnamed_addr constant i32 32, align 4

@compressed_assembly_descriptors = dso_local local_unnamed_addr global [32 x %struct.CompressedAssemblyDescriptor] [
	%struct.CompressedAssemblyDescriptor {
		i32 2560, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 0; uint32_t buffer_offset
	}, ; 0: _Microsoft.Android.Resource.Designer
	%struct.CompressedAssemblyDescriptor {
		i32 55808, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2560; uint32_t buffer_offset
	}, ; 1: SenateNight.Android
	%struct.CompressedAssemblyDescriptor {
		i32 22016, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 58368; uint32_t buffer_offset
	}, ; 2: System.Collections.Concurrent
	%struct.CompressedAssemblyDescriptor {
		i32 11776, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 80384; uint32_t buffer_offset
	}, ; 3: System.Collections.NonGeneric
	%struct.CompressedAssemblyDescriptor {
		i32 8192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 92160; uint32_t buffer_offset
	}, ; 4: System.Collections
	%struct.CompressedAssemblyDescriptor {
		i32 11776, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 100352; uint32_t buffer_offset
	}, ; 5: System.Console
	%struct.CompressedAssemblyDescriptor {
		i32 46080, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 112128; uint32_t buffer_offset
	}, ; 6: System.Diagnostics.DiagnosticSource
	%struct.CompressedAssemblyDescriptor {
		i32 61952, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 158208; uint32_t buffer_offset
	}, ; 7: System.Formats.Asn1
	%struct.CompressedAssemblyDescriptor {
		i32 22016, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 220160; uint32_t buffer_offset
	}, ; 8: System.IO.Compression.Brotli
	%struct.CompressedAssemblyDescriptor {
		i32 32768, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 242176; uint32_t buffer_offset
	}, ; 9: System.IO.Compression
	%struct.CompressedAssemblyDescriptor {
		i32 8704, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 274944; uint32_t buffer_offset
	}, ; 10: System.IO.Pipelines
	%struct.CompressedAssemblyDescriptor {
		i32 40960, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 283648; uint32_t buffer_offset
	}, ; 11: System.Linq
	%struct.CompressedAssemblyDescriptor {
		i32 15360, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 324608; uint32_t buffer_offset
	}, ; 12: System.Memory
	%struct.CompressedAssemblyDescriptor {
		i32 363520, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 339968; uint32_t buffer_offset
	}, ; 13: System.Net.Http
	%struct.CompressedAssemblyDescriptor {
		i32 26624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 703488; uint32_t buffer_offset
	}, ; 14: System.Net.NameResolution
	%struct.CompressedAssemblyDescriptor {
		i32 25088, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 730112; uint32_t buffer_offset
	}, ; 15: System.Net.NetworkInformation
	%struct.CompressedAssemblyDescriptor {
		i32 66560, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 755200; uint32_t buffer_offset
	}, ; 16: System.Net.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 146944, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 821760; uint32_t buffer_offset
	}, ; 17: System.Net.Security
	%struct.CompressedAssemblyDescriptor {
		i32 101376, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 968704; uint32_t buffer_offset
	}, ; 18: System.Net.Sockets
	%struct.CompressedAssemblyDescriptor {
		i32 70656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 1070080; uint32_t buffer_offset
	}, ; 19: System.Private.Uri
	%struct.CompressedAssemblyDescriptor {
		i32 9216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 1140736; uint32_t buffer_offset
	}, ; 20: System.Runtime.InteropServices
	%struct.CompressedAssemblyDescriptor {
		i32 69120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 1149952; uint32_t buffer_offset
	}, ; 21: System.Runtime.Numerics
	%struct.CompressedAssemblyDescriptor {
		i32 7680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 1219072; uint32_t buffer_offset
	}, ; 22: System.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 163840, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 1226752; uint32_t buffer_offset
	}, ; 23: System.Security.Cryptography
	%struct.CompressedAssemblyDescriptor {
		i32 26624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 1390592; uint32_t buffer_offset
	}, ; 24: System.Text.Encodings.Web
	%struct.CompressedAssemblyDescriptor {
		i32 84992, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 1417216; uint32_t buffer_offset
	}, ; 25: System.Text.Json
	%struct.CompressedAssemblyDescriptor {
		i32 24064, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 1502208; uint32_t buffer_offset
	}, ; 26: System.Threading.Channels
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 1526272; uint32_t buffer_offset
	}, ; 27: System.Threading
	%struct.CompressedAssemblyDescriptor {
		i32 1676288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 1538560; uint32_t buffer_offset
	}, ; 28: System.Private.CoreLib
	%struct.CompressedAssemblyDescriptor {
		i32 163328, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 3214848; uint32_t buffer_offset
	}, ; 29: Java.Interop
	%struct.CompressedAssemblyDescriptor {
		i32 22328, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 3378176; uint32_t buffer_offset
	}, ; 30: Mono.Android.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 393728, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 3400504; uint32_t buffer_offset
	} ; 31: Mono.Android
], align 16

@uncompressed_assemblies_data_size = dso_local local_unnamed_addr constant i32 3794232, align 4

@uncompressed_assemblies_data_buffer = dso_local local_unnamed_addr global [3794232 x i8] zeroinitializer, align 16

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/10.0.1xx @ db080b91dbe7947a69005a203ea98d9bb207ad04"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
