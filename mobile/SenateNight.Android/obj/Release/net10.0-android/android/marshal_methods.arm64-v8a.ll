; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [32 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [96 x i64] [
	i64 u0x02abedc11addc1ed, ; 0: lib_Mono.Android.Runtime.dll.so => 30
	i64 u0x0517ef04e06e9f76, ; 1: System.Net.Primitives => 16
	i64 u0x0581db89237110e9, ; 2: lib_System.Collections.dll.so => 4
	i64 u0x07dcdc7460a0c5e4, ; 3: System.Collections.NonGeneric => 3
	i64 u0x092266563089ae3e, ; 4: lib_System.Collections.NonGeneric.dll.so => 3
	i64 u0x09d144a7e214d457, ; 5: System.Security.Cryptography => 23
	i64 u0x0abb3e2b271edc45, ; 6: System.Threading.Channels.dll => 26
	i64 u0x0c59ad9fbbd43abe, ; 7: Mono.Android => 31
	i64 u0x0e14e73a54dda68e, ; 8: lib_System.Net.NameResolution.dll.so => 14
	i64 u0x10f6cfcbcf801616, ; 9: System.IO.Compression.Brotli => 8
	i64 u0x13f1e5e209e91af4, ; 10: lib_Java.Interop.dll.so => 29
	i64 u0x17f9358913beb16a, ; 11: System.Text.Encodings.Web => 24
	i64 u0x1a91866a319e9259, ; 12: lib_System.Collections.Concurrent.dll.so => 2
	i64 u0x1c753b5ff15bce1b, ; 13: Mono.Android.Runtime.dll => 30
	i64 u0x209375905fcc1bad, ; 14: lib_System.IO.Compression.Brotli.dll.so => 8
	i64 u0x2174319c0d835bc9, ; 15: System.Runtime => 22
	i64 u0x2407aef2bbe8fadf, ; 16: System.Console => 5
	i64 u0x27b410442fad6cf1, ; 17: Java.Interop.dll => 29
	i64 u0x2801845a2c71fbfb, ; 18: System.Net.Primitives.dll => 16
	i64 u0x2a3b095612184159, ; 19: lib_System.Net.NetworkInformation.dll.so => 15
	i64 u0x2afc1c4f898552ee, ; 20: lib_System.Formats.Asn1.dll.so => 7
	i64 u0x2d169d318a968379, ; 21: System.Threading.dll => 27
	i64 u0x2db915caf23548d2, ; 22: System.Text.Json.dll => 25
	i64 u0x31195fef5d8fb552, ; 23: _Microsoft.Android.Resource.Designer.dll => 0
	i64 u0x341abc357fbb4ebf, ; 24: lib_System.Net.Sockets.dll.so => 18
	i64 u0x38869c811d74050e, ; 25: System.Net.NameResolution.dll => 14
	i64 u0x434c4e1d9284cdae, ; 26: Mono.Android.dll => 31
	i64 u0x4b7b6532ded934b7, ; 27: System.Text.Json => 25
	i64 u0x4cf6f67dc77aacd2, ; 28: System.Net.NetworkInformation.dll => 15
	i64 u0x4e32f00cb0937401, ; 29: Mono.Android.Runtime => 30
	i64 u0x4ebd0c4b82c5eefc, ; 30: lib_System.Threading.Channels.dll.so => 26
	i64 u0x526ce79eb8e90527, ; 31: lib_System.Net.Primitives.dll.so => 16
	i64 u0x53a96d5c86c9e194, ; 32: System.Net.NetworkInformation => 15
	i64 u0x54795225dd1587af, ; 33: lib_System.Runtime.dll.so => 22
	i64 u0x571c5cfbec5ae8e2, ; 34: System.Private.Uri => 19
	i64 u0x579a06fed6eec900, ; 35: System.Private.CoreLib.dll => 28
	i64 u0x57c542c14049b66d, ; 36: System.Diagnostics.DiagnosticSource => 6
	i64 u0x5a8f6699f4a1caa9, ; 37: lib_System.Threading.dll.so => 27
	i64 u0x5db0cbbd1028510e, ; 38: lib_System.Runtime.InteropServices.dll.so => 20
	i64 u0x5ea92fdb19ec8c4c, ; 39: System.Text.Encodings.Web.dll => 24
	i64 u0x60f62d786afcf130, ; 40: System.Memory => 12
	i64 u0x622eef6f9e59068d, ; 41: System.Private.CoreLib => 28
	i64 u0x65ece51227bfa724, ; 42: lib_System.Runtime.Numerics.dll.so => 21
	i64 u0x6692e924eade1b29, ; 43: lib_System.Console.dll.so => 5
	i64 u0x68fbbbe2eb455198, ; 44: System.Formats.Asn1 => 7
	i64 u0x6a4d7577b2317255, ; 45: System.Runtime.InteropServices.dll => 20
	i64 u0x73e4ce94e2eb6ffc, ; 46: lib_System.Memory.dll.so => 12
	i64 u0x76a3082753dc1c00, ; 47: SenateNight.Android.dll => 1
	i64 u0x76ca07b878f44da0, ; 48: System.Runtime.Numerics.dll => 21
	i64 u0x7dfc3d6d9d8d7b70, ; 49: System.Collections => 4
	i64 u0x87f6569b25707834, ; 50: System.IO.Compression.Brotli.dll => 8
	i64 u0x8b4ff5d0fdd5faa1, ; 51: lib_System.Diagnostics.DiagnosticSource.dll.so => 6
	i64 u0x8d7b8ab4b3310ead, ; 52: System.Threading => 27
	i64 u0x8da188285aadfe8e, ; 53: System.Collections.Concurrent => 2
	i64 u0x903101b46fb73a04, ; 54: _Microsoft.Android.Resource.Designer => 0
	i64 u0x90393bd4865292f3, ; 55: lib_System.IO.Compression.dll.so => 9
	i64 u0x9157bd523cd7ed36, ; 56: lib_System.Text.Json.dll.so => 25
	i64 u0x91a74f07b30d37e2, ; 57: System.Linq.dll => 11
	i64 u0x944077d8ca3c6580, ; 58: System.IO.Compression.dll => 9
	i64 u0x97e144c9d3c6976e, ; 59: System.Collections.Concurrent.dll => 2
	i64 u0xa0d8259f4cc284ec, ; 60: lib_System.Security.Cryptography.dll.so => 23
	i64 u0xa2572680829d2c7c, ; 61: System.IO.Pipelines.dll => 10
	i64 u0xa5f1ba49b85dd355, ; 62: System.Security.Cryptography.dll => 23
	i64 u0xaa52de307ef5d1dd, ; 63: System.Net.Http => 13
	i64 u0xac2af3fa195a15ce, ; 64: System.Runtime.Numerics => 21
	i64 u0xacf42eea7ef9cd12, ; 65: System.Threading.Channels => 26
	i64 u0xadf511667bef3595, ; 66: System.Net.Security => 17
	i64 u0xae282bcd03739de7, ; 67: Java.Interop => 29
	i64 u0xb4bd7015ecee9d86, ; 68: System.IO.Pipelines => 10
	i64 u0xb81a2c6e0aee50fe, ; 69: lib_System.Private.CoreLib.dll.so => 28
	i64 u0xba48785529705af9, ; 70: System.Collections.dll => 4
	i64 u0xbb65706fde942ce3, ; 71: System.Net.Sockets => 18
	i64 u0xbd0e2c0d55246576, ; 72: System.Net.Http.dll => 13
	i64 u0xc0d928351ab5ca77, ; 73: System.Console.dll => 5
	i64 u0xc12b8b3afa48329c, ; 74: lib_System.Linq.dll.so => 11
	i64 u0xc5a0f4b95a699af7, ; 75: lib_System.Private.Uri.dll.so => 19
	i64 u0xcbd4fdd9cef4a294, ; 76: lib__Microsoft.Android.Resource.Designer.dll.so => 0
	i64 u0xcf23d8093f3ceadf, ; 77: System.Diagnostics.DiagnosticSource.dll => 6
	i64 u0xd333d0af9e423810, ; 78: System.Runtime.InteropServices => 20
	i64 u0xd3651b6fc3125825, ; 79: System.Private.Uri.dll => 19
	i64 u0xd8673e0f40205a28, ; 80: SenateNight.Android => 1
	i64 u0xdad05a11827959a3, ; 81: System.Collections.NonGeneric.dll => 3
	i64 u0xdbf9607a441b4505, ; 82: System.Linq => 11
	i64 u0xdd2b722d78ef5f43, ; 83: System.Runtime.dll => 22
	i64 u0xdd67031857c72f96, ; 84: lib_System.Text.Encodings.Web.dll.so => 24
	i64 u0xe192a588d4410686, ; 85: lib_System.IO.Pipelines.dll.so => 10
	i64 u0xe1ecfdb7fff86067, ; 86: System.Net.Security.dll => 17
	i64 u0xe5434e8a119ceb69, ; 87: lib_Mono.Android.dll.so => 31
	i64 u0xedc4817167106c23, ; 88: System.Net.Sockets.dll => 18
	i64 u0xedc632067fb20ff3, ; 89: System.Memory.dll => 12
	i64 u0xf09e47b6ae914f6e, ; 90: System.Net.NameResolution => 14
	i64 u0xf1c4b4005493d871, ; 91: System.Formats.Asn1.dll => 7
	i64 u0xf4c1dd70a5496a17, ; 92: System.IO.Compression => 9
	i64 u0xf6655cc8c882961d, ; 93: lib_SenateNight.Android.dll.so => 1
	i64 u0xfa3f278f288b0e84, ; 94: lib_System.Net.Security.dll.so => 17
	i64 u0xfbf0a31c9fc34bc4 ; 95: lib_System.Net.Http.dll.so => 13
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [96 x i32] [
	i32 30, i32 16, i32 4, i32 3, i32 3, i32 23, i32 26, i32 31,
	i32 14, i32 8, i32 29, i32 24, i32 2, i32 30, i32 8, i32 22,
	i32 5, i32 29, i32 16, i32 15, i32 7, i32 27, i32 25, i32 0,
	i32 18, i32 14, i32 31, i32 25, i32 15, i32 30, i32 26, i32 16,
	i32 15, i32 22, i32 19, i32 28, i32 6, i32 27, i32 20, i32 24,
	i32 12, i32 28, i32 21, i32 5, i32 7, i32 20, i32 12, i32 1,
	i32 21, i32 4, i32 8, i32 6, i32 27, i32 2, i32 0, i32 9,
	i32 25, i32 11, i32 9, i32 2, i32 23, i32 10, i32 23, i32 13,
	i32 21, i32 26, i32 17, i32 29, i32 10, i32 28, i32 4, i32 18,
	i32 13, i32 5, i32 11, i32 19, i32 0, i32 6, i32 20, i32 19,
	i32 1, i32 3, i32 11, i32 22, i32 24, i32 10, i32 17, i32 31,
	i32 18, i32 12, i32 14, i32 7, i32 9, i32 1, i32 17, i32 13
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 8, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [8 x %struct.MarshalMethodsManagedClass] [
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000d2, ; class name: Java.IO.InputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 0
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000e8, ; class name: Java.Lang.Object, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 1
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000d5, ; class name: Java.IO.OutputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 2
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000f8, ; class name: Java.Lang.IRunnableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 3
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000b5, ; class name: Android.App.Activity, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 4
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200004f, ; class name: Android.Webkit.WebViewClient, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 5
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000c6, ; class name: Android.App.Service, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 6
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200010f, ; class name: Java.Interop.TypeManager/JavaTypeManager, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	} ; 7
], align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [8 x ptr] [
	ptr @.mm.0, ; 0 ('Java.IO.InputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.1, ; 1 ('Java.Lang.Object, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.2, ; 2 ('Java.IO.OutputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.3, ; 3 ('Java.Lang.IRunnableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.4, ; 4 ('Android.App.Activity, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.5, ; 5 ('Android.Webkit.WebViewClient, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.6, ; 6 ('Android.App.Service, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.7 ; 7 ('Java.Interop.TypeManager/JavaTypeManager, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
], align 8

@mm_method_names = dso_local local_unnamed_addr constant [24 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000001f0600064e, ; name: n_Close_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.0_name; char* name
	}, ; 0
	%struct.MarshalMethodName {
		i64 u0x0000001f0600064f, ; name: n_Read_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.1_name; char* name
	}, ; 1
	%struct.MarshalMethodName {
		i64 u0x0000001f06000650, ; name: n_Read_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.2_name; char* name
	}, ; 2
	%struct.MarshalMethodName {
		i64 u0x0000001f06000651, ; name: n_Read_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.3_name; char* name
	}, ; 3
	%struct.MarshalMethodName {
		i64 u0x0000001f060007db, ; name: n_Equals_Ljava_lang_Object__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.4_name; char* name
	}, ; 4
	%struct.MarshalMethodName {
		i64 u0x0000001f060007dc, ; name: n_GetHashCode_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.5_name; char* name
	}, ; 5
	%struct.MarshalMethodName {
		i64 u0x0000001f060007dd, ; name: n_ToString_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.6_name; char* name
	}, ; 6
	%struct.MarshalMethodName {
		i64 u0x0000001f0600066e, ; name: n_Close_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.0_name; char* name
	}, ; 7
	%struct.MarshalMethodName {
		i64 u0x0000001f0600066f, ; name: n_Flush_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.7_name; char* name
	}, ; 8
	%struct.MarshalMethodName {
		i64 u0x0000001f06000670, ; name: n_Write_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.8_name; char* name
	}, ; 9
	%struct.MarshalMethodName {
		i64 u0x0000001f06000671, ; name: n_Write_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.9_name; char* name
	}, ; 10
	%struct.MarshalMethodName {
		i64 u0x0000001f06000672, ; name: n_Write_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.10_name; char* name
	}, ; 11
	%struct.MarshalMethodName {
		i64 u0x0000001f06000873, ; name: n_Run_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.11_name; char* name
	}, ; 12
	%struct.MarshalMethodName {
		i64 u0x0000001f06000567, ; name: n_OnCreate_Landroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.12_name; char* name
	}, ; 13
	%struct.MarshalMethodName {
		i64 u0x0000001f06000568, ; name: n_OnRequestPermissionsResult_IarrayLjava_lang_String_arrayI_mm_wrapper(IntPtr,IntPtr,Int32,IntPtr,IntPtr)
		ptr @.MarshalMethodName.13_name; char* name
	}, ; 14
	%struct.MarshalMethodName {
		i64 u0x0000001f06000569, ; name: n_OnResume_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.14_name; char* name
	}, ; 15
	%struct.MarshalMethodName {
		i64 u0x0000001f0600056a, ; name: n_OnPause_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.15_name; char* name
	}, ; 16
	%struct.MarshalMethodName {
		i64 u0x0000001f060000f5, ; name: n_OnPageFinished_Landroid_webkit_WebView_Ljava_lang_String__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.16_name; char* name
	}, ; 17
	%struct.MarshalMethodName {
		i64 u0x0000001f060000f6, ; name: n_ShouldOverrideUrlLoading_Landroid_webkit_WebView_Landroid_webkit_WebResourceRequest__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.17_name; char* name
	}, ; 18
	%struct.MarshalMethodName {
		i64 u0x0000001f060005f9, ; name: n_OnBind_Landroid_content_Intent__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.18_name; char* name
	}, ; 19
	%struct.MarshalMethodName {
		i64 u0x0000001f060005fa, ; name: n_OnStartCommand_Landroid_content_Intent_II_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.19_name; char* name
	}, ; 20
	%struct.MarshalMethodName {
		i64 u0x0000001f060005fb, ; name: n_OnDestroy_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.20_name; char* name
	}, ; 21
	%struct.MarshalMethodName {
		i64 u0x0000001f06000919, ; name: n_Activate_mm(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.21_name; char* name
	}, ; 22
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.22_name; char* name
	} ; 23
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Marshal methods backing fields, pointers to native functions
@native_cb_close_0_0_600064e = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_read_0_0_600064f = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_read_0_0_6000650 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_read_0_0_6000651 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_equals_0_1_60007db = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_hashCode_0_1_60007dc = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_toString_0_1_60007dd = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_close_0_2_600066e = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_flush_0_2_600066f = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_write_0_2_6000670 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_write_0_2_6000671 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_write_0_2_6000672 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_run_0_3_6000873 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onCreate_0_4_6000567 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onRequestPermissionsResult_0_4_6000568 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onResume_0_4_6000569 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onPause_0_4_600056a = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onPageFinished_0_5_60000f5 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_shouldOverrideUrlLoading_0_5_60000f6 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onBind_0_6_60005f9 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onStartCommand_0_6_60005fa = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDestroy_0_6_60005fb = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_activate_0_7_6000919 = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.mm.8)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Method: System.Void Java.IO.InputStream::n_Close_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.InputStream::Close()
; Implemented: System.Void Android.Runtime.InputStreamAdapter::Close()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_InputStreamAdapter_n_1close(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_close_0_0_600064e, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 0, i32 noundef 100664910, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_close_0_0_600064e)
	%cb2 = load ptr, ptr @native_cb_close_0_0_600064e, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Int32 Java.IO.InputStream::n_Read_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.IO.InputStream::Read()
; Implemented: System.Int32 Android.Runtime.InputStreamAdapter::Read()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_InputStreamAdapter_n_1read__(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_read_0_0_600064f, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 0, i32 noundef 100664911, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_read_0_0_600064f)
	%cb2 = load ptr, ptr @native_cb_read_0_0_600064f, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass)
	ret i32 %1
}

; Method: System.Int32 Java.IO.InputStream::n_Read_arrayB_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.IO.InputStream::Read(System.Byte[])
; Implemented: System.Int32 Android.Runtime.InputStreamAdapter::Read(System.Byte[])
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_InputStreamAdapter_n_1read___3B(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_read_0_0_6000650, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 0, i32 noundef 100664912, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_read_0_0_6000650)
	%cb2 = load ptr, ptr @native_cb_read_0_0_6000650, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes)
	ret i32 %1
}

; Method: System.Int32 Java.IO.InputStream::n_Read_arrayBII_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.IO.InputStream::Read(System.Byte[],System.Int32,System.Int32)
; Implemented: System.Int32 Android.Runtime.InputStreamAdapter::Read(System.Byte[],System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_InputStreamAdapter_n_1read___3BII(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes, i32 noundef %offset, i32 noundef %length) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_read_0_0_6000651, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 0, i32 noundef 100664913, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_read_0_0_6000651)
	%cb2 = load ptr, ptr @native_cb_read_0_0_6000651, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes, i32 noundef %offset, i32 noundef %length)
	ret i32 %1
}

; Method: System.SByte Java.Lang.Object::n_Equals_Ljava_lang_Object__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Java.Lang.Object::Equals(Java.Lang.Object)
; Implemented: System.Boolean Android.Runtime.JavaObject::Equals(Java.Lang.Object)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_mono_android_runtime_JavaObject_n_1equals(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_equals_0_1_60007db, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 1, i32 noundef 100665307, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_equals_0_1_60007db)
	%cb2 = load ptr, ptr @native_cb_equals_0_1_60007db, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.Int32 Java.Lang.Object::n_GetHashCode_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.Lang.Object::GetHashCode()
; Implemented: System.Int32 Android.Runtime.JavaObject::GetHashCode()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_JavaObject_n_1hashCode(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_hashCode_0_1_60007dc, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 1, i32 noundef 100665308, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_hashCode_0_1_60007dc)
	%cb2 = load ptr, ptr @native_cb_hashCode_0_1_60007dc, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass)
	ret i32 %1
}

; Method: System.IntPtr Java.Lang.Object::n_ToString_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.String Java.Lang.Object::ToString()
; Implemented: System.String Android.Runtime.JavaObject::ToString()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_mono_android_runtime_JavaObject_n_1toString(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_toString_0_1_60007dd, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 1, i32 noundef 100665309, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_toString_0_1_60007dd)
	%cb2 = load ptr, ptr @native_cb_toString_0_1_60007dd, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass)
	ret ptr %1
}

; Method: System.Void Java.IO.OutputStream::n_Close_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Close()
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Close()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1close(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_close_0_2_600066e, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 2, i32 noundef 100664942, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_close_0_2_600066e)
	%cb2 = load ptr, ptr @native_cb_close_0_2_600066e, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Flush_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Flush()
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Flush()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1flush(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_flush_0_2_600066f, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 2, i32 noundef 100664943, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_flush_0_2_600066f)
	%cb2 = load ptr, ptr @native_cb_flush_0_2_600066f, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Write_arrayB_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Write(System.Byte[])
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Write(System.Byte[])
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1write___3B(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_write_0_2_6000670, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 2, i32 noundef 100664944, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_write_0_2_6000670)
	%cb2 = load ptr, ptr @native_cb_write_0_2_6000670, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Write_arrayBII_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Write(System.Byte[],System.Int32,System.Int32)
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Write(System.Byte[],System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1write___3BII(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer, i32 noundef %offset, i32 noundef %length) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_write_0_2_6000671, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 2, i32 noundef 100664945, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_write_0_2_6000671)
	%cb2 = load ptr, ptr @native_cb_write_0_2_6000671, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer, i32 noundef %offset, i32 noundef %length)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Write_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Write(System.Int32)
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Write(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1write__I(ptr noundef %env, ptr noundef %klass, i32 noundef %oneByte) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_write_0_2_6000672, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 2, i32 noundef 100664946, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_write_0_2_6000672)
	%cb2 = load ptr, ptr @native_cb_write_0_2_6000672, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %oneByte)
	ret void
}

; Method: System.Void Java.Lang.IRunnableInvoker::n_Run_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.Lang.IRunnable::Run()
; Implemented: System.Void Java.Lang.IRunnable::Run()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_java_lang_RunnableImplementor_n_1run(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_run_0_3_6000873, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 3, i32 noundef 100665459, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_run_0_3_6000873)
	%cb2 = load ptr, ptr @native_cb_run_0_3_6000873, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnCreate_Landroid_os_Bundle__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnCreate(Android.OS.Bundle)
; Implemented: System.Void SenateNight.MainActivity::OnCreate(Android.OS.Bundle)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64fdf5be6716f4b455_MainActivity_n_1onCreate(ptr noundef %env, ptr noundef %klass, ptr noundef %savedInstanceState) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onCreate_0_4_6000567, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 4, i32 noundef 100664679, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onCreate_0_4_6000567)
	%cb2 = load ptr, ptr @native_cb_onCreate_0_4_6000567, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %savedInstanceState)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnRequestPermissionsResult_IarrayLjava_lang_String_arrayI_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnRequestPermissionsResult(System.Int32,System.String[],Android.Content.PM.Permission[])
; Implemented: System.Void SenateNight.MainActivity::OnRequestPermissionsResult(System.Int32,System.String[],Android.Content.PM.Permission[])
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64fdf5be6716f4b455_MainActivity_n_1onRequestPermissionsResult(ptr noundef %env, ptr noundef %klass, i32 noundef %requestCode, ptr noundef %permissions, ptr noundef %grantResults) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onRequestPermissionsResult_0_4_6000568, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 4, i32 noundef 100664680, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onRequestPermissionsResult_0_4_6000568)
	%cb2 = load ptr, ptr @native_cb_onRequestPermissionsResult_0_4_6000568, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %requestCode, ptr noundef %permissions, ptr noundef %grantResults)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnResume_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnResume()
; Implemented: System.Void SenateNight.MainActivity::OnResume()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64fdf5be6716f4b455_MainActivity_n_1onResume(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onResume_0_4_6000569, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 4, i32 noundef 100664681, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onResume_0_4_6000569)
	%cb2 = load ptr, ptr @native_cb_onResume_0_4_6000569, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnPause_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnPause()
; Implemented: System.Void SenateNight.MainActivity::OnPause()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64fdf5be6716f4b455_MainActivity_n_1onPause(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onPause_0_4_600056a, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 4, i32 noundef 100664682, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onPause_0_4_600056a)
	%cb2 = load ptr, ptr @native_cb_onPause_0_4_600056a, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.Webkit.WebViewClient::n_OnPageFinished_Landroid_webkit_WebView_Ljava_lang_String__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Webkit.WebViewClient::OnPageFinished(Android.Webkit.WebView,System.String)
; Implemented: System.Void SenateNight.MainActivity/PageClient::OnPageFinished(Android.Webkit.WebView,System.String)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64fdf5be6716f4b455_MainActivity_1PageClient_n_1onPageFinished(ptr noundef %env, ptr noundef %klass, ptr noundef %view, ptr noundef %url) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onPageFinished_0_5_60000f5, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 5, i32 noundef 100663541, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onPageFinished_0_5_60000f5)
	%cb2 = load ptr, ptr @native_cb_onPageFinished_0_5_60000f5, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %view, ptr noundef %url)
	ret void
}

; Method: System.SByte Android.Webkit.WebViewClient::n_ShouldOverrideUrlLoading_Landroid_webkit_WebView_Landroid_webkit_WebResourceRequest__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Webkit.WebViewClient::ShouldOverrideUrlLoading(Android.Webkit.WebView,Android.Webkit.IWebResourceRequest)
; Implemented: System.Boolean SenateNight.MainActivity/PageClient::ShouldOverrideUrlLoading(Android.Webkit.WebView,Android.Webkit.IWebResourceRequest)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc64fdf5be6716f4b455_MainActivity_1PageClient_n_1shouldOverrideUrlLoading(ptr noundef %env, ptr noundef %klass, ptr noundef %view, ptr noundef %request) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_shouldOverrideUrlLoading_0_5_60000f6, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 5, i32 noundef 100663542, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_shouldOverrideUrlLoading_0_5_60000f6)
	%cb2 = load ptr, ptr @native_cb_shouldOverrideUrlLoading_0_5_60000f6, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %view, ptr noundef %request)
	ret i1 %1
}

; Method: System.IntPtr Android.App.Service::n_OnBind_Landroid_content_Intent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Android.OS.IBinder Android.App.Service::OnBind(Android.Content.Intent)
; Implemented: Android.OS.IBinder SenateNight.ScoreService::OnBind(Android.Content.Intent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_senatenight_ScoreService_n_1onBind(ptr noundef %env, ptr noundef %klass, ptr noundef %intent) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onBind_0_6_60005f9, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 6, i32 noundef 100664825, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onBind_0_6_60005f9)
	%cb2 = load ptr, ptr @native_cb_onBind_0_6_60005f9, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %intent)
	ret ptr %1
}

; Method: System.Int32 Android.App.Service::n_OnStartCommand_Landroid_content_Intent_II_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Android.App.StartCommandResult Android.App.Service::OnStartCommand(Android.Content.Intent,Android.App.StartCommandFlags,System.Int32)
; Implemented: Android.App.StartCommandResult SenateNight.ScoreService::OnStartCommand(Android.Content.Intent,Android.App.StartCommandFlags,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_senatenight_ScoreService_n_1onStartCommand(ptr noundef %env, ptr noundef %klass, ptr noundef %intent, i32 noundef %flags, i32 noundef %startId) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onStartCommand_0_6_60005fa, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 6, i32 noundef 100664826, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onStartCommand_0_6_60005fa)
	%cb2 = load ptr, ptr @native_cb_onStartCommand_0_6_60005fa, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %intent, i32 noundef %flags, i32 noundef %startId)
	ret i32 %1
}

; Method: System.Void Android.App.Service::n_OnDestroy_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Service::OnDestroy()
; Implemented: System.Void SenateNight.ScoreService::OnDestroy()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_senatenight_ScoreService_n_1onDestroy(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDestroy_0_6_60005fb, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 6, i32 noundef 100664827, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDestroy_0_6_60005fb)
	%cb2 = load ptr, ptr @native_cb_onDestroy_0_6_60005fb, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Java.Interop.TypeManager/JavaTypeManager::n_Activate_mm(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: none
; Implemented: none
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_TypeManager_n_1activate(ptr noundef %env, ptr noundef %klass, ptr noundef %jnienv, ptr noundef %jclass, ptr noundef %typename_ptr, ptr noundef %signature_ptr) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_activate_0_7_6000919, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 31, i32 noundef 7, i32 noundef 100665625, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_activate_0_7_6000919)
	%cb2 = load ptr, ptr @native_cb_activate_0_7_6000919, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %jnienv, ptr noundef %jclass, ptr noundef %typename_ptr, ptr noundef %signature_ptr)
	ret void
}

; Strings
@.mm.0 = private unnamed_addr constant [101 x i8] c"Java.IO.InputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.1 = private unnamed_addr constant [98 x i8] c"Java.Lang.Object, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.2 = private unnamed_addr constant [102 x i8] c"Java.IO.OutputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.3 = private unnamed_addr constant [108 x i8] c"Java.Lang.IRunnableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.4 = private unnamed_addr constant [102 x i8] c"Android.App.Activity, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.5 = private unnamed_addr constant [110 x i8] c"Android.Webkit.WebViewClient, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.6 = private unnamed_addr constant [101 x i8] c"Android.App.Service, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.7 = private unnamed_addr constant [122 x i8] c"Java.Interop.TypeManager/JavaTypeManager, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.8 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [34 x i8] c"n_Close_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.1_name = private unnamed_addr constant [33 x i8] c"n_Read_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.2_name = private unnamed_addr constant [47 x i8] c"n_Read_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.3_name = private unnamed_addr constant [61 x i8] c"n_Read_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.4_name = private unnamed_addr constant [61 x i8] c"n_Equals_Ljava_lang_Object__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.5_name = private unnamed_addr constant [40 x i8] c"n_GetHashCode_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.6_name = private unnamed_addr constant [37 x i8] c"n_ToString_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.7_name = private unnamed_addr constant [34 x i8] c"n_Flush_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.8_name = private unnamed_addr constant [48 x i8] c"n_Write_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.9_name = private unnamed_addr constant [62 x i8] c"n_Write_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.10_name = private unnamed_addr constant [42 x i8] c"n_Write_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.11_name = private unnamed_addr constant [32 x i8] c"n_Run_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.12_name = private unnamed_addr constant [64 x i8] c"n_OnCreate_Landroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.13_name = private unnamed_addr constant [106 x i8] c"n_OnRequestPermissionsResult_IarrayLjava_lang_String_arrayI_mm_wrapper(IntPtr,IntPtr,Int32,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.14_name = private unnamed_addr constant [37 x i8] c"n_OnResume_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.15_name = private unnamed_addr constant [36 x i8] c"n_OnPause_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.16_name = private unnamed_addr constant [100 x i8] c"n_OnPageFinished_Landroid_webkit_WebView_Ljava_lang_String__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.17_name = private unnamed_addr constant [127 x i8] c"n_ShouldOverrideUrlLoading_Landroid_webkit_WebView_Landroid_webkit_WebResourceRequest__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.18_name = private unnamed_addr constant [67 x i8] c"n_OnBind_Landroid_content_Intent__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.19_name = private unnamed_addr constant [89 x i8] c"n_OnStartCommand_Landroid_content_Intent_II_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.20_name = private unnamed_addr constant [38 x i8] c"n_OnDestroy_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.21_name = private unnamed_addr constant [57 x i8] c"n_Activate_mm(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.22_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }
attributes #3 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/10.0.1xx @ db080b91dbe7947a69005a203ea98d9bb207ad04"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
