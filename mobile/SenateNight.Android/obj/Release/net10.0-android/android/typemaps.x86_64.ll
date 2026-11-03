; ModuleID = 'typemaps.x86_64.ll'
source_filename = "typemaps.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.TypeMapJava = type {
	i32, ; uint32_t module_index
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_name_index
}

%struct.TypeMapModule = type {
	[16 x i8], ; uint8_t module_uuid[16]
	i32, ; uint32_t entry_count
	i32, ; uint32_t duplicate_count
	ptr, ; TypeMapModuleEntry map
	ptr, ; TypeMapModuleEntry duplicate_map
	ptr, ; char* assembly_name
	ptr, ; MonoImage image
	i32, ; uint32_t java_name_width
	ptr ; uint8_t java_map
}

%struct.TypeMapModuleEntry = type {
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_map_index
}

@map_module_count = dso_local local_unnamed_addr constant i32 3, align 4

@java_type_count = dso_local local_unnamed_addr constant i32 110, align 4

; Managed modules map
@map_modules = dso_local local_unnamed_addr global [3 x %struct.TypeMapModule] [
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x01, i8 u0xd3, i8 u0x16, i8 u0x71, i8 u0xee, i8 u0xcb, i8 u0xb2, i8 u0x4a, i8 u0xa2, i8 u0xcb, i8 u0xb0, i8 u0x26, i8 u0x8c, i8 u0x23, i8 u0x68, i8 u0x66 ], ; module_uuid: 7116d301-cbee-4ab2-a2cb-b0268c236866
		i32 3, ; uint32_t entry_count
		i32 0, ; uint32_t duplicate_count
		ptr @module0_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.0_assembly_name, ; assembly_name: SenateNight.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 0
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x48, i8 u0x26, i8 u0x93, i8 u0x50, i8 u0xbf, i8 u0x19, i8 u0x7c, i8 u0x41, i8 u0xad, i8 u0x1a, i8 u0x54, i8 u0x6a, i8 u0xb9, i8 u0x35, i8 u0x77, i8 u0x4f ], ; module_uuid: 50932648-19bf-417c-ad1a-546ab935774f
		i32 95, ; uint32_t entry_count
		i32 27, ; uint32_t duplicate_count
		ptr @module1_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module1_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.1_assembly_name, ; assembly_name: Mono.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 1
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x94, i8 u0x7a, i8 u0x97, i8 u0x1b, i8 u0xb9, i8 u0xe4, i8 u0x93, i8 u0x48, i8 u0x98, i8 u0x79, i8 u0x09, i8 u0x80, i8 u0x35, i8 u0xa3, i8 u0x59, i8 u0xd6 ], ; module_uuid: 1b977a94-e4b9-4893-9879-098035a359d6
		i32 14, ; uint32_t entry_count
		i32 2, ; uint32_t duplicate_count
		ptr @module2_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module2_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.2_assembly_name, ; assembly_name: Java.Interop
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	} ; 2
], align 16

; Java types name hashes
@map_java_hashes = dso_local local_unnamed_addr constant [110 x i64] [
	i64 u0x01cd624f1e38cc9f, ; 0 => java/lang/Byte
	i64 u0x0b1da699fb29019a, ; 1 => android/os/BaseBundle
	i64 u0x0b95dc6056abf25b, ; 2 => android/widget/FrameLayout
	i64 u0x0c44130caa233945, ; 3 => mono/android/runtime/JavaObject
	i64 u0x0d9335f0988cd796, ; 4 => java/util/HashMap
	i64 u0x10cc64dc53558d33, ; 5 => android/content/ComponentName
	i64 u0x16b07129ee36476e, ; 6 => android/os/PowerManager
	i64 u0x194b32fbae047fc7, ; 7 => net/dot/jni/internal/JavaProxyObject
	i64 u0x1bdd1c9e89062055, ; 8 => crc64fdf5be6716f4b455/MainActivity
	i64 u0x1e04bf19f9c14045, ; 9 => android/util/AttributeSet
	i64 u0x1e69018626ef9ffb, ; 10 => android/os/Handler
	i64 u0x1eef7492beaf81e2, ; 11 => android/os/IInterface
	i64 u0x225c20a45cb91cd7, ; 12 => java/lang/Error
	i64 u0x286198988bf88ae8, ; 13 => android/app/Notification$BigTextStyle
	i64 u0x321c29cf8c6f7a93, ; 14 => android/content/res/Resources
	i64 u0x32d6a1d6ee9f6d5a, ; 15 => android/content/Intent
	i64 u0x332031975eda7654, ; 16 => java/lang/Boolean
	i64 u0x35e989807a64bcd9, ; 17 => java/lang/IllegalStateException
	i64 u0x39f1c81500ddb55b, ; 18 => [F
	i64 u0x406e54c64b3bee74, ; 19 => android/runtime/JavaProxyThrowable
	i64 u0x40c05cff47992547, ; 20 => android/view/ViewGroup
	i64 u0x418a18fba47ed847, ; 21 => android/os/PowerManager$WakeLock
	i64 u0x43877e18293df0e7, ; 22 => crc64fdf5be6716f4b455/MainActivity_PageClient
	i64 u0x4930daf7c10ff422, ; 23 => android/app/Notification$Builder
	i64 u0x4f858ea9c9162f43, ; 24 => android/os/IBinder
	i64 u0x516bd5763f07d608, ; 25 => android/net/Uri
	i64 u0x5181b129b1a25949, ; 26 => java/lang/Class
	i64 u0x5238ad63b58da994, ; 27 => java/lang/ClassCastException
	i64 u0x529da4201fa0d461, ; 28 => net/dot/jni/internal/JavaProxyThrowable
	i64 u0x53ead18b9df3fcb2, ; 29 => android/os/IBinder$FrozenStateChangeCallback
	i64 u0x543ee7a3edd80785, ; 30 => android/app/Notification
	i64 u0x551ac881eb4466c0, ; 31 => java/lang/Number
	i64 u0x55f72f5bdbb6740d, ; 32 => android/webkit/WebResourceRequest
	i64 u0x56081cb97bd634f8, ; 33 => android/app/Notification$Style
	i64 u0x560a92597b121e00, ; 34 => [C
	i64 u0x56365290d5a06704, ; 35 => java/lang/LinkageError
	i64 u0x57e37830b49b24af, ; 36 => android/app/NotificationChannel
	i64 u0x5a6af884fe3c181e, ; 37 => android/os/Bundle
	i64 u0x5bfd65ae1a6e6ffc, ; 38 => android/app/Activity
	i64 u0x5f5a9fc3430795a4, ; 39 => android/content/ContextWrapper
	i64 u0x5f7e709faf8646e0, ; 40 => java/lang/Short
	i64 u0x6007b40f26982334, ; 41 => senatenight/ScoreService
	i64 u0x6027a9ca62000b75, ; 42 => android/app/Notification$Action$Builder
	i64 u0x61428f9f249ac534, ; 43 => [Z
	i64 u0x65f6b14b7e978927, ; 44 => java/io/IOException
	i64 u0x6e0fb15bd0f04d15, ; 45 => java/lang/StackTraceElement
	i64 u0x720cd712e1248c34, ; 46 => java/util/Iterator
	i64 u0x75591c18ddf5e52d, ; 47 => mono/android/TypeManager
	i64 u0x76cbd2104dd555ed, ; 48 => android/content/Context
	i64 u0x76cd544434e023e9, ; 49 => android/widget/AbsoluteLayout
	i64 u0x786e5a40bb3c74ca, ; 50 => android/webkit/ValueCallback
	i64 u0x79b8e6ed4e0962cc, ; 51 => android/webkit/WebView
	i64 u0x7b90c42bde036cae, ; 52 => [I
	i64 u0x7b925bdca68a0101, ; 53 => java/util/ArrayList
	i64 u0x7e201ad40955df46, ; 54 => android/os/Parcel
	i64 u0x84f94178aab6cc34, ; 55 => java/lang/CharSequence
	i64 u0x852b5457ebdd5c87, ; 56 => android/view/ViewGroup$LayoutParams
	i64 u0x888700b03d541d93, ; 57 => java/lang/RuntimeException
	i64 u0x88f7510c649f4a97, ; 58 => java/io/InputStream
	i64 u0x8a3ea3c274e8ce68, ; 59 => java/lang/Character
	i64 u0x90b4aeb45636cd6a, ; 60 => mono/android/runtime/OutputStreamAdapter
	i64 u0x92188d393e2af2d2, ; 61 => java/lang/Throwable
	i64 u0x92b59c839bc46278, ; 62 => java/lang/Thread
	i64 u0x965bfaf1ff1da014, ; 63 => java/lang/ReflectiveOperationException
	i64 u0x98ba110c6c57da31, ; 64 => java/lang/Float
	i64 u0x99df91bab800c287, ; 65 => mono/android/runtime/InputStreamAdapter
	i64 u0x9a23c2d41060f81e, ; 66 => java/io/File
	i64 u0x9a68fa465ca8abf9, ; 67 => java/io/FileDescriptor
	i64 u0x9e10a0b3efa170dc, ; 68 => android/view/ContextThemeWrapper
	i64 u0x9fa1370a1b1093fa, ; 69 => java/lang/NullPointerException
	i64 u0xa865adbdd81d9951, ; 70 => java/io/OutputStream
	i64 u0xabc3cd0f40f748aa, ; 71 => java/lang/String
	i64 u0xac9902bb0e4c5217, ; 72 => java/lang/IllegalArgumentException
	i64 u0xacaf4fe23af1f72a, ; 73 => [S
	i64 u0xada6872f699d2ae8, ; 74 => [J
	i64 u0xb02badeb1c97535c, ; 75 => java/lang/Integer
	i64 u0xb18d71343ca8e96f, ; 76 => java/lang/Exception
	i64 u0xb374dc7d92c34054, ; 77 => android/webkit/WebViewClient
	i64 u0xb69317d4cbae2478, ; 78 => android/content/res/Configuration
	i64 u0xb6c4749da9477c3a, ; 79 => [B
	i64 u0xb77aae9e2e13bfcc, ; 80 => android/app/Service
	i64 u0xb8df224d6b778ca3, ; 81 => android/view/View
	i64 u0xbb84ccbe48f6c18b, ; 82 => android/os/Looper
	i64 u0xbf6d427143271cb3, ; 83 => java/lang/Object
	i64 u0xc00f4c2f11efdcff, ; 84 => java/lang/ClassNotFoundException
	i64 u0xc2a8e50a5f08afc6, ; 85 => mono/java/lang/RunnableImplementor
	i64 u0xca35caf567cfa745, ; 86 => java/util/Collection
	i64 u0xca754b77efc8606b, ; 87 => android/app/NotificationManager
	i64 u0xcc306823503920e9, ; 88 => android/app/Application
	i64 u0xd1b288a9c7bb8f53, ; 89 => java/lang/Double
	i64 u0xd1bb565fc45586eb, ; 90 => android/app/PendingIntent
	i64 u0xd202c8ea2a504e12, ; 91 => android/webkit/WebSettings
	i64 u0xd2fc750314fd2213, ; 92 => [D
	i64 u0xd758f43330d4e0ad, ; 93 => android/graphics/drawable/Icon
	i64 u0xdd812f1d4afa427b, ; 94 => java/lang/UnsupportedOperationException
	i64 u0xdfabd9351f4351a6, ; 95 => [Ljava/lang/Object;
	i64 u0xe024b538ad65ea66, ; 96 => java/util/function/Consumer
	i64 u0xe0446bf91fb0c2dd, ; 97 => java/lang/NoClassDefFoundError
	i64 u0xe1b3c5871398eb28, ; 98 => java/nio/channels/FileChannel
	i64 u0xe38528954b158fff, ; 99 => java/util/concurrent/Executor
	i64 u0xe5abbaa9de37d34b, ; 100 => net/dot/jni/ManagedPeer
	i64 u0xeb82145dcac4c559, ; 101 => java/lang/Long
	i64 u0xed49ed70aa9be1b3, ; 102 => java/nio/channels/spi/AbstractInterruptibleChannel
	i64 u0xef2f2996a1d369cc, ; 103 => java/io/FileInputStream
	i64 u0xf11f22a6441fcfbc, ; 104 => java/lang/IndexOutOfBoundsException
	i64 u0xf538b0bbba86c935, ; 105 => android/app/Notification$Action
	i64 u0xfb0541dba11b69d9, ; 106 => android/graphics/Color
	i64 u0xfbe9bfa5cc50fed6, ; 107 => java/util/HashSet
	i64 u0xfd2b1a3de667eb51, ; 108 => java/lang/Runnable
	i64 u0xfd45cc49d3236300 ; 109 => android/os/IBinder$DeathRecipient
], align 16

@module0_managed_to_java = internal dso_local constant [3 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000003, ; uint32_t type_token_id
		i32 8; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000004, ; uint32_t type_token_id
		i32 41; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 22; uint32_t java_map_index
	} ; 2
], align 16

@module1_managed_to_java = internal dso_local constant [95 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000048, ; uint32_t type_token_id
		i32 50; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200004a, ; uint32_t type_token_id
		i32 32; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 91; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 51; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200004f, ; uint32_t type_token_id
		i32 77; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000050, ; uint32_t type_token_id
		i32 49; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000051, ; uint32_t type_token_id
		i32 2; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000052, ; uint32_t type_token_id
		i32 9; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000054, ; uint32_t type_token_id
		i32 10; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000055, ; uint32_t type_token_id
		i32 6; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000056, ; uint32_t type_token_id
		i32 21; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000057, ; uint32_t type_token_id
		i32 1; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000058, ; uint32_t type_token_id
		i32 37; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000059, ; uint32_t type_token_id
		i32 109; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x0200005b, ; uint32_t type_token_id
		i32 24; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x0200005c, ; uint32_t type_token_id
		i32 29; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x0200005f, ; uint32_t type_token_id
		i32 11; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x02000061, ; uint32_t type_token_id
		i32 82; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x02000062, ; uint32_t type_token_id
		i32 54; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x02000065, ; uint32_t type_token_id
		i32 81; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x02000066, ; uint32_t type_token_id
		i32 68; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x02000067, ; uint32_t type_token_id
		i32 20; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x02000068, ; uint32_t type_token_id
		i32 56; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x0200007d, ; uint32_t type_token_id
		i32 65; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x0200007f, ; uint32_t type_token_id
		i32 86; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x02000081, ; uint32_t type_token_id
		i32 4; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x0200008a, ; uint32_t type_token_id
		i32 53; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x0200008c, ; uint32_t type_token_id
		i32 3; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x0200008d, ; uint32_t type_token_id
		i32 19; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x0200008e, ; uint32_t type_token_id
		i32 107; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x0200009a, ; uint32_t type_token_id
		i32 60; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x020000a1, ; uint32_t type_token_id
		i32 25; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x020000a5, ; uint32_t type_token_id
		i32 106; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x020000a6, ; uint32_t type_token_id
		i32 93; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x020000a7, ; uint32_t type_token_id
		i32 48; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x020000a8, ; uint32_t type_token_id
		i32 15; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x020000aa, ; uint32_t type_token_id
		i32 5; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x020000ac, ; uint32_t type_token_id
		i32 39; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x020000ad, ; uint32_t type_token_id
		i32 78; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x020000ae, ; uint32_t type_token_id
		i32 14; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x020000b5, ; uint32_t type_token_id
		i32 38; uint32_t java_map_index
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 u0x020000b6, ; uint32_t type_token_id
		i32 88; uint32_t java_map_index
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 u0x020000b7, ; uint32_t type_token_id
		i32 30; uint32_t java_map_index
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 u0x020000b8, ; uint32_t type_token_id
		i32 105; uint32_t java_map_index
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 u0x020000b9, ; uint32_t type_token_id
		i32 42; uint32_t java_map_index
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 u0x020000ba, ; uint32_t type_token_id
		i32 13; uint32_t java_map_index
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 u0x020000bb, ; uint32_t type_token_id
		i32 23; uint32_t java_map_index
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 u0x020000bc, ; uint32_t type_token_id
		i32 33; uint32_t java_map_index
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 u0x020000be, ; uint32_t type_token_id
		i32 87; uint32_t java_map_index
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 u0x020000c2, ; uint32_t type_token_id
		i32 36; uint32_t java_map_index
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 u0x020000c4, ; uint32_t type_token_id
		i32 90; uint32_t java_map_index
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 u0x020000c6, ; uint32_t type_token_id
		i32 80; uint32_t java_map_index
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 u0x020000cb, ; uint32_t type_token_id
		i32 98; uint32_t java_map_index
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 u0x020000cd, ; uint32_t type_token_id
		i32 102; uint32_t java_map_index
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 u0x020000cf, ; uint32_t type_token_id
		i32 66; uint32_t java_map_index
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 u0x020000d0, ; uint32_t type_token_id
		i32 67; uint32_t java_map_index
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 u0x020000d1, ; uint32_t type_token_id
		i32 103; uint32_t java_map_index
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 u0x020000d2, ; uint32_t type_token_id
		i32 58; uint32_t java_map_index
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 u0x020000d4, ; uint32_t type_token_id
		i32 44; uint32_t java_map_index
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 u0x020000d5, ; uint32_t type_token_id
		i32 70; uint32_t java_map_index
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 u0x020000d7, ; uint32_t type_token_id
		i32 46; uint32_t java_map_index
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 u0x020000d9, ; uint32_t type_token_id
		i32 96; uint32_t java_map_index
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 u0x020000db, ; uint32_t type_token_id
		i32 99; uint32_t java_map_index
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 u0x020000dd, ; uint32_t type_token_id
		i32 16; uint32_t java_map_index
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 u0x020000de, ; uint32_t type_token_id
		i32 0; uint32_t java_map_index
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 u0x020000df, ; uint32_t type_token_id
		i32 59; uint32_t java_map_index
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 u0x020000e0, ; uint32_t type_token_id
		i32 26; uint32_t java_map_index
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 u0x020000e1, ; uint32_t type_token_id
		i32 84; uint32_t java_map_index
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 u0x020000e2, ; uint32_t type_token_id
		i32 89; uint32_t java_map_index
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 u0x020000e3, ; uint32_t type_token_id
		i32 76; uint32_t java_map_index
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 u0x020000e4, ; uint32_t type_token_id
		i32 64; uint32_t java_map_index
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 u0x020000e5, ; uint32_t type_token_id
		i32 55; uint32_t java_map_index
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 u0x020000e6, ; uint32_t type_token_id
		i32 75; uint32_t java_map_index
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 u0x020000e7, ; uint32_t type_token_id
		i32 101; uint32_t java_map_index
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 u0x020000e8, ; uint32_t type_token_id
		i32 83; uint32_t java_map_index
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 u0x020000e9, ; uint32_t type_token_id
		i32 57; uint32_t java_map_index
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 u0x020000ea, ; uint32_t type_token_id
		i32 40; uint32_t java_map_index
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 u0x020000eb, ; uint32_t type_token_id
		i32 71; uint32_t java_map_index
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 u0x020000ed, ; uint32_t type_token_id
		i32 62; uint32_t java_map_index
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 u0x020000ee, ; uint32_t type_token_id
		i32 85; uint32_t java_map_index
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 u0x020000ef, ; uint32_t type_token_id
		i32 61; uint32_t java_map_index
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 u0x020000f0, ; uint32_t type_token_id
		i32 27; uint32_t java_map_index
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 u0x020000f1, ; uint32_t type_token_id
		i32 12; uint32_t java_map_index
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 u0x020000f4, ; uint32_t type_token_id
		i32 72; uint32_t java_map_index
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 u0x020000f5, ; uint32_t type_token_id
		i32 17; uint32_t java_map_index
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 u0x020000f6, ; uint32_t type_token_id
		i32 104; uint32_t java_map_index
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 u0x020000f7, ; uint32_t type_token_id
		i32 108; uint32_t java_map_index
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 u0x020000f9, ; uint32_t type_token_id
		i32 35; uint32_t java_map_index
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 u0x020000fa, ; uint32_t type_token_id
		i32 97; uint32_t java_map_index
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 u0x020000fb, ; uint32_t type_token_id
		i32 69; uint32_t java_map_index
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 u0x020000fc, ; uint32_t type_token_id
		i32 31; uint32_t java_map_index
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 u0x020000fe, ; uint32_t type_token_id
		i32 63; uint32_t java_map_index
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 u0x020000ff, ; uint32_t type_token_id
		i32 45; uint32_t java_map_index
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 u0x02000100, ; uint32_t type_token_id
		i32 94; uint32_t java_map_index
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 u0x0200010f, ; uint32_t type_token_id
		i32 47; uint32_t java_map_index
	} ; 94
], align 16

@module1_managed_to_java_duplicates = internal dso_local constant [27 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000049, ; uint32_t type_token_id
		i32 50; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 32; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200004d, ; uint32_t type_token_id
		i32 91; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000053, ; uint32_t type_token_id
		i32 9; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200005a, ; uint32_t type_token_id
		i32 109; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200005d, ; uint32_t type_token_id
		i32 29; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 24; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000060, ; uint32_t type_token_id
		i32 11; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000069, ; uint32_t type_token_id
		i32 20; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000080, ; uint32_t type_token_id
		i32 86; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000086, ; uint32_t type_token_id
		i32 4; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200008b, ; uint32_t type_token_id
		i32 53; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200008f, ; uint32_t type_token_id
		i32 107; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x020000a2, ; uint32_t type_token_id
		i32 25; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x020000ab, ; uint32_t type_token_id
		i32 48; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x020000bd, ; uint32_t type_token_id
		i32 33; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x020000c7, ; uint32_t type_token_id
		i32 80; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x020000cc, ; uint32_t type_token_id
		i32 98; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x020000ce, ; uint32_t type_token_id
		i32 102; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x020000d3, ; uint32_t type_token_id
		i32 58; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x020000d6, ; uint32_t type_token_id
		i32 70; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x020000d8, ; uint32_t type_token_id
		i32 46; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x020000da, ; uint32_t type_token_id
		i32 96; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x020000dc, ; uint32_t type_token_id
		i32 99; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x020000f2, ; uint32_t type_token_id
		i32 55; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x020000f8, ; uint32_t type_token_id
		i32 108; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x020000fd, ; uint32_t type_token_id
		i32 31; uint32_t java_map_index
	} ; 26
], align 16

@module2_managed_to_java = internal dso_local constant [14 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000006, ; uint32_t type_token_id
		i32 95; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 61; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 83; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 43; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000030, ; uint32_t type_token_id
		i32 79; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000034, ; uint32_t type_token_id
		i32 34; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000038, ; uint32_t type_token_id
		i32 73; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200003c, ; uint32_t type_token_id
		i32 52; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000040, ; uint32_t type_token_id
		i32 74; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000044, ; uint32_t type_token_id
		i32 18; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000048, ; uint32_t type_token_id
		i32 92; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 7; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 28; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000094, ; uint32_t type_token_id
		i32 100; uint32_t java_map_index
	} ; 13
], align 16

@module2_managed_to_java_duplicates = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000a, ; uint32_t type_token_id
		i32 95; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 95; uint32_t java_map_index
	} ; 1
], align 16

; Java to managed map
@map_java = dso_local local_unnamed_addr constant [110 x %struct.TypeMapJava] [
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000de, ; uint32_t type_token_id
		i32 64; uint32_t java_name_index
	}, ; 0
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000057, ; uint32_t type_token_id
		i32 11; uint32_t java_name_index
	}, ; 1
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000051, ; uint32_t type_token_id
		i32 6; uint32_t java_name_index
	}, ; 2
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200008c, ; uint32_t type_token_id
		i32 27; uint32_t java_name_index
	}, ; 3
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000081, ; uint32_t type_token_id
		i32 25; uint32_t java_name_index
	}, ; 4
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000aa, ; uint32_t type_token_id
		i32 36; uint32_t java_name_index
	}, ; 5
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000055, ; uint32_t type_token_id
		i32 9; uint32_t java_name_index
	}, ; 6
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 107; uint32_t java_name_index
	}, ; 7
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000003, ; uint32_t type_token_id
		i32 95; uint32_t java_name_index
	}, ; 8
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 7; uint32_t java_name_index
	}, ; 9
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000054, ; uint32_t type_token_id
		i32 8; uint32_t java_name_index
	}, ; 10
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 16; uint32_t java_name_index
	}, ; 11
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000f1, ; uint32_t type_token_id
		i32 82; uint32_t java_name_index
	}, ; 12
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ba, ; uint32_t type_token_id
		i32 45; uint32_t java_name_index
	}, ; 13
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ae, ; uint32_t type_token_id
		i32 39; uint32_t java_name_index
	}, ; 14
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000a8, ; uint32_t type_token_id
		i32 35; uint32_t java_name_index
	}, ; 15
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000dd, ; uint32_t type_token_id
		i32 63; uint32_t java_name_index
	}, ; 16
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000f5, ; uint32_t type_token_id
		i32 84; uint32_t java_name_index
	}, ; 17
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000044, ; uint32_t type_token_id
		i32 105; uint32_t java_name_index
	}, ; 18
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200008d, ; uint32_t type_token_id
		i32 28; uint32_t java_name_index
	}, ; 19
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000067, ; uint32_t type_token_id
		i32 21; uint32_t java_name_index
	}, ; 20
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000056, ; uint32_t type_token_id
		i32 10; uint32_t java_name_index
	}, ; 21
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 96; uint32_t java_name_index
	}, ; 22
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000bb, ; uint32_t type_token_id
		i32 46; uint32_t java_name_index
	}, ; 23
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 14; uint32_t java_name_index
	}, ; 24
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000a1, ; uint32_t type_token_id
		i32 31; uint32_t java_name_index
	}, ; 25
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000e0, ; uint32_t type_token_id
		i32 66; uint32_t java_name_index
	}, ; 26
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000f0, ; uint32_t type_token_id
		i32 81; uint32_t java_name_index
	}, ; 27
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 108; uint32_t java_name_index
	}, ; 28
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 15; uint32_t java_name_index
	}, ; 29
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000b7, ; uint32_t type_token_id
		i32 42; uint32_t java_name_index
	}, ; 30
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000fc, ; uint32_t type_token_id
		i32 90; uint32_t java_name_index
	}, ; 31
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1; uint32_t java_name_index
	}, ; 32
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000bc, ; uint32_t type_token_id
		i32 47; uint32_t java_name_index
	}, ; 33
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000034, ; uint32_t type_token_id
		i32 101; uint32_t java_name_index
	}, ; 34
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000f9, ; uint32_t type_token_id
		i32 87; uint32_t java_name_index
	}, ; 35
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000c2, ; uint32_t type_token_id
		i32 49; uint32_t java_name_index
	}, ; 36
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000058, ; uint32_t type_token_id
		i32 12; uint32_t java_name_index
	}, ; 37
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000b5, ; uint32_t type_token_id
		i32 40; uint32_t java_name_index
	}, ; 38
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ac, ; uint32_t type_token_id
		i32 37; uint32_t java_name_index
	}, ; 39
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ea, ; uint32_t type_token_id
		i32 76; uint32_t java_name_index
	}, ; 40
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000004, ; uint32_t type_token_id
		i32 97; uint32_t java_name_index
	}, ; 41
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000b9, ; uint32_t type_token_id
		i32 44; uint32_t java_name_index
	}, ; 42
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 99; uint32_t java_name_index
	}, ; 43
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000d4, ; uint32_t type_token_id
		i32 58; uint32_t java_name_index
	}, ; 44
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ff, ; uint32_t type_token_id
		i32 92; uint32_t java_name_index
	}, ; 45
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 60; uint32_t java_name_index
	}, ; 46
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200010f, ; uint32_t type_token_id
		i32 94; uint32_t java_name_index
	}, ; 47
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000a7, ; uint32_t type_token_id
		i32 34; uint32_t java_name_index
	}, ; 48
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000050, ; uint32_t type_token_id
		i32 5; uint32_t java_name_index
	}, ; 49
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 0; uint32_t java_name_index
	}, ; 50
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 3; uint32_t java_name_index
	}, ; 51
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x0200003c, ; uint32_t type_token_id
		i32 103; uint32_t java_name_index
	}, ; 52
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200008a, ; uint32_t type_token_id
		i32 26; uint32_t java_name_index
	}, ; 53
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000062, ; uint32_t type_token_id
		i32 18; uint32_t java_name_index
	}, ; 54
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 71; uint32_t java_name_index
	}, ; 55
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000068, ; uint32_t type_token_id
		i32 22; uint32_t java_name_index
	}, ; 56
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000e9, ; uint32_t type_token_id
		i32 75; uint32_t java_name_index
	}, ; 57
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000d2, ; uint32_t type_token_id
		i32 57; uint32_t java_name_index
	}, ; 58
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000df, ; uint32_t type_token_id
		i32 65; uint32_t java_name_index
	}, ; 59
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200009a, ; uint32_t type_token_id
		i32 30; uint32_t java_name_index
	}, ; 60
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ef, ; uint32_t type_token_id
		i32 80; uint32_t java_name_index
	}, ; 61
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ed, ; uint32_t type_token_id
		i32 78; uint32_t java_name_index
	}, ; 62
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000fe, ; uint32_t type_token_id
		i32 91; uint32_t java_name_index
	}, ; 63
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000e4, ; uint32_t type_token_id
		i32 70; uint32_t java_name_index
	}, ; 64
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200007d, ; uint32_t type_token_id
		i32 23; uint32_t java_name_index
	}, ; 65
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000cf, ; uint32_t type_token_id
		i32 54; uint32_t java_name_index
	}, ; 66
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000d0, ; uint32_t type_token_id
		i32 55; uint32_t java_name_index
	}, ; 67
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000066, ; uint32_t type_token_id
		i32 20; uint32_t java_name_index
	}, ; 68
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000fb, ; uint32_t type_token_id
		i32 89; uint32_t java_name_index
	}, ; 69
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000d5, ; uint32_t type_token_id
		i32 59; uint32_t java_name_index
	}, ; 70
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000eb, ; uint32_t type_token_id
		i32 77; uint32_t java_name_index
	}, ; 71
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000f4, ; uint32_t type_token_id
		i32 83; uint32_t java_name_index
	}, ; 72
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000038, ; uint32_t type_token_id
		i32 102; uint32_t java_name_index
	}, ; 73
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000040, ; uint32_t type_token_id
		i32 104; uint32_t java_name_index
	}, ; 74
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000e6, ; uint32_t type_token_id
		i32 72; uint32_t java_name_index
	}, ; 75
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000e3, ; uint32_t type_token_id
		i32 69; uint32_t java_name_index
	}, ; 76
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200004f, ; uint32_t type_token_id
		i32 4; uint32_t java_name_index
	}, ; 77
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ad, ; uint32_t type_token_id
		i32 38; uint32_t java_name_index
	}, ; 78
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000030, ; uint32_t type_token_id
		i32 100; uint32_t java_name_index
	}, ; 79
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000c6, ; uint32_t type_token_id
		i32 51; uint32_t java_name_index
	}, ; 80
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000065, ; uint32_t type_token_id
		i32 19; uint32_t java_name_index
	}, ; 81
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000061, ; uint32_t type_token_id
		i32 17; uint32_t java_name_index
	}, ; 82
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000e8, ; uint32_t type_token_id
		i32 74; uint32_t java_name_index
	}, ; 83
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000e1, ; uint32_t type_token_id
		i32 67; uint32_t java_name_index
	}, ; 84
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ee, ; uint32_t type_token_id
		i32 79; uint32_t java_name_index
	}, ; 85
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200007f, ; uint32_t type_token_id
		i32 24; uint32_t java_name_index
	}, ; 86
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000be, ; uint32_t type_token_id
		i32 48; uint32_t java_name_index
	}, ; 87
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000b6, ; uint32_t type_token_id
		i32 41; uint32_t java_name_index
	}, ; 88
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000e2, ; uint32_t type_token_id
		i32 68; uint32_t java_name_index
	}, ; 89
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000c4, ; uint32_t type_token_id
		i32 50; uint32_t java_name_index
	}, ; 90
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 2; uint32_t java_name_index
	}, ; 91
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000048, ; uint32_t type_token_id
		i32 106; uint32_t java_name_index
	}, ; 92
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000a6, ; uint32_t type_token_id
		i32 33; uint32_t java_name_index
	}, ; 93
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000100, ; uint32_t type_token_id
		i32 93; uint32_t java_name_index
	}, ; 94
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 98; uint32_t java_name_index
	}, ; 95
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 61; uint32_t java_name_index
	}, ; 96
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000fa, ; uint32_t type_token_id
		i32 88; uint32_t java_name_index
	}, ; 97
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000cb, ; uint32_t type_token_id
		i32 52; uint32_t java_name_index
	}, ; 98
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 62; uint32_t java_name_index
	}, ; 99
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000094, ; uint32_t type_token_id
		i32 109; uint32_t java_name_index
	}, ; 100
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000e7, ; uint32_t type_token_id
		i32 73; uint32_t java_name_index
	}, ; 101
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000cd, ; uint32_t type_token_id
		i32 53; uint32_t java_name_index
	}, ; 102
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000d1, ; uint32_t type_token_id
		i32 56; uint32_t java_name_index
	}, ; 103
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000f6, ; uint32_t type_token_id
		i32 85; uint32_t java_name_index
	}, ; 104
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000b8, ; uint32_t type_token_id
		i32 43; uint32_t java_name_index
	}, ; 105
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000a5, ; uint32_t type_token_id
		i32 32; uint32_t java_name_index
	}, ; 106
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200008e, ; uint32_t type_token_id
		i32 29; uint32_t java_name_index
	}, ; 107
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 86; uint32_t java_name_index
	}, ; 108
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 13; uint32_t java_name_index
	} ; 109
], align 16

; Java type names
@java_type_names = dso_local local_unnamed_addr constant [110 x ptr] [
	ptr @.tmr.0, ; 0 ('android/webkit/ValueCallback')
	ptr @.tmr.1, ; 1 ('android/webkit/WebResourceRequest')
	ptr @.tmr.2, ; 2 ('android/webkit/WebSettings')
	ptr @.tmr.3, ; 3 ('android/webkit/WebView')
	ptr @.tmr.4, ; 4 ('android/webkit/WebViewClient')
	ptr @.tmr.5, ; 5 ('android/widget/AbsoluteLayout')
	ptr @.tmr.6, ; 6 ('android/widget/FrameLayout')
	ptr @.tmr.7, ; 7 ('android/util/AttributeSet')
	ptr @.tmr.8, ; 8 ('android/os/Handler')
	ptr @.tmr.9, ; 9 ('android/os/PowerManager')
	ptr @.tmr.10, ; 10 ('android/os/PowerManager$WakeLock')
	ptr @.tmr.11, ; 11 ('android/os/BaseBundle')
	ptr @.tmr.12, ; 12 ('android/os/Bundle')
	ptr @.tmr.13, ; 13 ('android/os/IBinder$DeathRecipient')
	ptr @.tmr.14, ; 14 ('android/os/IBinder')
	ptr @.tmr.15, ; 15 ('android/os/IBinder$FrozenStateChangeCallback')
	ptr @.tmr.16, ; 16 ('android/os/IInterface')
	ptr @.tmr.17, ; 17 ('android/os/Looper')
	ptr @.tmr.18, ; 18 ('android/os/Parcel')
	ptr @.tmr.19, ; 19 ('android/view/View')
	ptr @.tmr.20, ; 20 ('android/view/ContextThemeWrapper')
	ptr @.tmr.21, ; 21 ('android/view/ViewGroup')
	ptr @.tmr.22, ; 22 ('android/view/ViewGroup$LayoutParams')
	ptr @.tmr.23, ; 23 ('mono/android/runtime/InputStreamAdapter')
	ptr @.tmr.24, ; 24 ('java/util/Collection')
	ptr @.tmr.25, ; 25 ('java/util/HashMap')
	ptr @.tmr.26, ; 26 ('java/util/ArrayList')
	ptr @.tmr.27, ; 27 ('mono/android/runtime/JavaObject')
	ptr @.tmr.28, ; 28 ('android/runtime/JavaProxyThrowable')
	ptr @.tmr.29, ; 29 ('java/util/HashSet')
	ptr @.tmr.30, ; 30 ('mono/android/runtime/OutputStreamAdapter')
	ptr @.tmr.31, ; 31 ('android/net/Uri')
	ptr @.tmr.32, ; 32 ('android/graphics/Color')
	ptr @.tmr.33, ; 33 ('android/graphics/drawable/Icon')
	ptr @.tmr.34, ; 34 ('android/content/Context')
	ptr @.tmr.35, ; 35 ('android/content/Intent')
	ptr @.tmr.36, ; 36 ('android/content/ComponentName')
	ptr @.tmr.37, ; 37 ('android/content/ContextWrapper')
	ptr @.tmr.38, ; 38 ('android/content/res/Configuration')
	ptr @.tmr.39, ; 39 ('android/content/res/Resources')
	ptr @.tmr.40, ; 40 ('android/app/Activity')
	ptr @.tmr.41, ; 41 ('android/app/Application')
	ptr @.tmr.42, ; 42 ('android/app/Notification')
	ptr @.tmr.43, ; 43 ('android/app/Notification$Action')
	ptr @.tmr.44, ; 44 ('android/app/Notification$Action$Builder')
	ptr @.tmr.45, ; 45 ('android/app/Notification$BigTextStyle')
	ptr @.tmr.46, ; 46 ('android/app/Notification$Builder')
	ptr @.tmr.47, ; 47 ('android/app/Notification$Style')
	ptr @.tmr.48, ; 48 ('android/app/NotificationManager')
	ptr @.tmr.49, ; 49 ('android/app/NotificationChannel')
	ptr @.tmr.50, ; 50 ('android/app/PendingIntent')
	ptr @.tmr.51, ; 51 ('android/app/Service')
	ptr @.tmr.52, ; 52 ('java/nio/channels/FileChannel')
	ptr @.tmr.53, ; 53 ('java/nio/channels/spi/AbstractInterruptibleChannel')
	ptr @.tmr.54, ; 54 ('java/io/File')
	ptr @.tmr.55, ; 55 ('java/io/FileDescriptor')
	ptr @.tmr.56, ; 56 ('java/io/FileInputStream')
	ptr @.tmr.57, ; 57 ('java/io/InputStream')
	ptr @.tmr.58, ; 58 ('java/io/IOException')
	ptr @.tmr.59, ; 59 ('java/io/OutputStream')
	ptr @.tmr.60, ; 60 ('java/util/Iterator')
	ptr @.tmr.61, ; 61 ('java/util/function/Consumer')
	ptr @.tmr.62, ; 62 ('java/util/concurrent/Executor')
	ptr @.tmr.63, ; 63 ('java/lang/Boolean')
	ptr @.tmr.64, ; 64 ('java/lang/Byte')
	ptr @.tmr.65, ; 65 ('java/lang/Character')
	ptr @.tmr.66, ; 66 ('java/lang/Class')
	ptr @.tmr.67, ; 67 ('java/lang/ClassNotFoundException')
	ptr @.tmr.68, ; 68 ('java/lang/Double')
	ptr @.tmr.69, ; 69 ('java/lang/Exception')
	ptr @.tmr.70, ; 70 ('java/lang/Float')
	ptr @.tmr.71, ; 71 ('java/lang/CharSequence')
	ptr @.tmr.72, ; 72 ('java/lang/Integer')
	ptr @.tmr.73, ; 73 ('java/lang/Long')
	ptr @.tmr.74, ; 74 ('java/lang/Object')
	ptr @.tmr.75, ; 75 ('java/lang/RuntimeException')
	ptr @.tmr.76, ; 76 ('java/lang/Short')
	ptr @.tmr.77, ; 77 ('java/lang/String')
	ptr @.tmr.78, ; 78 ('java/lang/Thread')
	ptr @.tmr.79, ; 79 ('mono/java/lang/RunnableImplementor')
	ptr @.tmr.80, ; 80 ('java/lang/Throwable')
	ptr @.tmr.81, ; 81 ('java/lang/ClassCastException')
	ptr @.tmr.82, ; 82 ('java/lang/Error')
	ptr @.tmr.83, ; 83 ('java/lang/IllegalArgumentException')
	ptr @.tmr.84, ; 84 ('java/lang/IllegalStateException')
	ptr @.tmr.85, ; 85 ('java/lang/IndexOutOfBoundsException')
	ptr @.tmr.86, ; 86 ('java/lang/Runnable')
	ptr @.tmr.87, ; 87 ('java/lang/LinkageError')
	ptr @.tmr.88, ; 88 ('java/lang/NoClassDefFoundError')
	ptr @.tmr.89, ; 89 ('java/lang/NullPointerException')
	ptr @.tmr.90, ; 90 ('java/lang/Number')
	ptr @.tmr.91, ; 91 ('java/lang/ReflectiveOperationException')
	ptr @.tmr.92, ; 92 ('java/lang/StackTraceElement')
	ptr @.tmr.93, ; 93 ('java/lang/UnsupportedOperationException')
	ptr @.tmr.94, ; 94 ('mono/android/TypeManager')
	ptr @.tmr.95, ; 95 ('crc64fdf5be6716f4b455/MainActivity')
	ptr @.tmr.96, ; 96 ('crc64fdf5be6716f4b455/MainActivity_PageClient')
	ptr @.tmr.97, ; 97 ('senatenight/ScoreService')
	ptr @.tmr.98, ; 98 ('[Ljava/lang/Object;')
	ptr @.tmr.99, ; 99 ('[Z')
	ptr @.tmr.100, ; 100 ('[B')
	ptr @.tmr.101, ; 101 ('[C')
	ptr @.tmr.102, ; 102 ('[S')
	ptr @.tmr.103, ; 103 ('[I')
	ptr @.tmr.104, ; 104 ('[J')
	ptr @.tmr.105, ; 105 ('[F')
	ptr @.tmr.106, ; 106 ('[D')
	ptr @.tmr.107, ; 107 ('net/dot/jni/internal/JavaProxyObject')
	ptr @.tmr.108, ; 108 ('net/dot/jni/internal/JavaProxyThrowable')
	ptr @.tmr.109 ; 109 ('net/dot/jni/ManagedPeer')
], align 16

; Strings
@.tmr.0 = private unnamed_addr constant [29 x i8] c"android/webkit/ValueCallback\00", align 16
@.tmr.1 = private unnamed_addr constant [34 x i8] c"android/webkit/WebResourceRequest\00", align 16
@.tmr.2 = private unnamed_addr constant [27 x i8] c"android/webkit/WebSettings\00", align 16
@.tmr.3 = private unnamed_addr constant [23 x i8] c"android/webkit/WebView\00", align 16
@.tmr.4 = private unnamed_addr constant [29 x i8] c"android/webkit/WebViewClient\00", align 16
@.tmr.5 = private unnamed_addr constant [30 x i8] c"android/widget/AbsoluteLayout\00", align 16
@.tmr.6 = private unnamed_addr constant [27 x i8] c"android/widget/FrameLayout\00", align 16
@.tmr.7 = private unnamed_addr constant [26 x i8] c"android/util/AttributeSet\00", align 16
@.tmr.8 = private unnamed_addr constant [19 x i8] c"android/os/Handler\00", align 16
@.tmr.9 = private unnamed_addr constant [24 x i8] c"android/os/PowerManager\00", align 16
@.tmr.10 = private unnamed_addr constant [33 x i8] c"android/os/PowerManager$WakeLock\00", align 16
@.tmr.11 = private unnamed_addr constant [22 x i8] c"android/os/BaseBundle\00", align 16
@.tmr.12 = private unnamed_addr constant [18 x i8] c"android/os/Bundle\00", align 16
@.tmr.13 = private unnamed_addr constant [34 x i8] c"android/os/IBinder$DeathRecipient\00", align 16
@.tmr.14 = private unnamed_addr constant [19 x i8] c"android/os/IBinder\00", align 16
@.tmr.15 = private unnamed_addr constant [45 x i8] c"android/os/IBinder$FrozenStateChangeCallback\00", align 16
@.tmr.16 = private unnamed_addr constant [22 x i8] c"android/os/IInterface\00", align 16
@.tmr.17 = private unnamed_addr constant [18 x i8] c"android/os/Looper\00", align 16
@.tmr.18 = private unnamed_addr constant [18 x i8] c"android/os/Parcel\00", align 16
@.tmr.19 = private unnamed_addr constant [18 x i8] c"android/view/View\00", align 16
@.tmr.20 = private unnamed_addr constant [33 x i8] c"android/view/ContextThemeWrapper\00", align 16
@.tmr.21 = private unnamed_addr constant [23 x i8] c"android/view/ViewGroup\00", align 16
@.tmr.22 = private unnamed_addr constant [36 x i8] c"android/view/ViewGroup$LayoutParams\00", align 16
@.tmr.23 = private unnamed_addr constant [40 x i8] c"mono/android/runtime/InputStreamAdapter\00", align 16
@.tmr.24 = private unnamed_addr constant [21 x i8] c"java/util/Collection\00", align 16
@.tmr.25 = private unnamed_addr constant [18 x i8] c"java/util/HashMap\00", align 16
@.tmr.26 = private unnamed_addr constant [20 x i8] c"java/util/ArrayList\00", align 16
@.tmr.27 = private unnamed_addr constant [32 x i8] c"mono/android/runtime/JavaObject\00", align 16
@.tmr.28 = private unnamed_addr constant [35 x i8] c"android/runtime/JavaProxyThrowable\00", align 16
@.tmr.29 = private unnamed_addr constant [18 x i8] c"java/util/HashSet\00", align 16
@.tmr.30 = private unnamed_addr constant [41 x i8] c"mono/android/runtime/OutputStreamAdapter\00", align 16
@.tmr.31 = private unnamed_addr constant [16 x i8] c"android/net/Uri\00", align 16
@.tmr.32 = private unnamed_addr constant [23 x i8] c"android/graphics/Color\00", align 16
@.tmr.33 = private unnamed_addr constant [31 x i8] c"android/graphics/drawable/Icon\00", align 16
@.tmr.34 = private unnamed_addr constant [24 x i8] c"android/content/Context\00", align 16
@.tmr.35 = private unnamed_addr constant [23 x i8] c"android/content/Intent\00", align 16
@.tmr.36 = private unnamed_addr constant [30 x i8] c"android/content/ComponentName\00", align 16
@.tmr.37 = private unnamed_addr constant [31 x i8] c"android/content/ContextWrapper\00", align 16
@.tmr.38 = private unnamed_addr constant [34 x i8] c"android/content/res/Configuration\00", align 16
@.tmr.39 = private unnamed_addr constant [30 x i8] c"android/content/res/Resources\00", align 16
@.tmr.40 = private unnamed_addr constant [21 x i8] c"android/app/Activity\00", align 16
@.tmr.41 = private unnamed_addr constant [24 x i8] c"android/app/Application\00", align 16
@.tmr.42 = private unnamed_addr constant [25 x i8] c"android/app/Notification\00", align 16
@.tmr.43 = private unnamed_addr constant [32 x i8] c"android/app/Notification$Action\00", align 16
@.tmr.44 = private unnamed_addr constant [40 x i8] c"android/app/Notification$Action$Builder\00", align 16
@.tmr.45 = private unnamed_addr constant [38 x i8] c"android/app/Notification$BigTextStyle\00", align 16
@.tmr.46 = private unnamed_addr constant [33 x i8] c"android/app/Notification$Builder\00", align 16
@.tmr.47 = private unnamed_addr constant [31 x i8] c"android/app/Notification$Style\00", align 16
@.tmr.48 = private unnamed_addr constant [32 x i8] c"android/app/NotificationManager\00", align 16
@.tmr.49 = private unnamed_addr constant [32 x i8] c"android/app/NotificationChannel\00", align 16
@.tmr.50 = private unnamed_addr constant [26 x i8] c"android/app/PendingIntent\00", align 16
@.tmr.51 = private unnamed_addr constant [20 x i8] c"android/app/Service\00", align 16
@.tmr.52 = private unnamed_addr constant [30 x i8] c"java/nio/channels/FileChannel\00", align 16
@.tmr.53 = private unnamed_addr constant [51 x i8] c"java/nio/channels/spi/AbstractInterruptibleChannel\00", align 16
@.tmr.54 = private unnamed_addr constant [13 x i8] c"java/io/File\00", align 1
@.tmr.55 = private unnamed_addr constant [23 x i8] c"java/io/FileDescriptor\00", align 16
@.tmr.56 = private unnamed_addr constant [24 x i8] c"java/io/FileInputStream\00", align 16
@.tmr.57 = private unnamed_addr constant [20 x i8] c"java/io/InputStream\00", align 16
@.tmr.58 = private unnamed_addr constant [20 x i8] c"java/io/IOException\00", align 16
@.tmr.59 = private unnamed_addr constant [21 x i8] c"java/io/OutputStream\00", align 16
@.tmr.60 = private unnamed_addr constant [19 x i8] c"java/util/Iterator\00", align 16
@.tmr.61 = private unnamed_addr constant [28 x i8] c"java/util/function/Consumer\00", align 16
@.tmr.62 = private unnamed_addr constant [30 x i8] c"java/util/concurrent/Executor\00", align 16
@.tmr.63 = private unnamed_addr constant [18 x i8] c"java/lang/Boolean\00", align 16
@.tmr.64 = private unnamed_addr constant [15 x i8] c"java/lang/Byte\00", align 1
@.tmr.65 = private unnamed_addr constant [20 x i8] c"java/lang/Character\00", align 16
@.tmr.66 = private unnamed_addr constant [16 x i8] c"java/lang/Class\00", align 16
@.tmr.67 = private unnamed_addr constant [33 x i8] c"java/lang/ClassNotFoundException\00", align 16
@.tmr.68 = private unnamed_addr constant [17 x i8] c"java/lang/Double\00", align 16
@.tmr.69 = private unnamed_addr constant [20 x i8] c"java/lang/Exception\00", align 16
@.tmr.70 = private unnamed_addr constant [16 x i8] c"java/lang/Float\00", align 16
@.tmr.71 = private unnamed_addr constant [23 x i8] c"java/lang/CharSequence\00", align 16
@.tmr.72 = private unnamed_addr constant [18 x i8] c"java/lang/Integer\00", align 16
@.tmr.73 = private unnamed_addr constant [15 x i8] c"java/lang/Long\00", align 1
@.tmr.74 = private unnamed_addr constant [17 x i8] c"java/lang/Object\00", align 16
@.tmr.75 = private unnamed_addr constant [27 x i8] c"java/lang/RuntimeException\00", align 16
@.tmr.76 = private unnamed_addr constant [16 x i8] c"java/lang/Short\00", align 16
@.tmr.77 = private unnamed_addr constant [17 x i8] c"java/lang/String\00", align 16
@.tmr.78 = private unnamed_addr constant [17 x i8] c"java/lang/Thread\00", align 16
@.tmr.79 = private unnamed_addr constant [35 x i8] c"mono/java/lang/RunnableImplementor\00", align 16
@.tmr.80 = private unnamed_addr constant [20 x i8] c"java/lang/Throwable\00", align 16
@.tmr.81 = private unnamed_addr constant [29 x i8] c"java/lang/ClassCastException\00", align 16
@.tmr.82 = private unnamed_addr constant [16 x i8] c"java/lang/Error\00", align 16
@.tmr.83 = private unnamed_addr constant [35 x i8] c"java/lang/IllegalArgumentException\00", align 16
@.tmr.84 = private unnamed_addr constant [32 x i8] c"java/lang/IllegalStateException\00", align 16
@.tmr.85 = private unnamed_addr constant [36 x i8] c"java/lang/IndexOutOfBoundsException\00", align 16
@.tmr.86 = private unnamed_addr constant [19 x i8] c"java/lang/Runnable\00", align 16
@.tmr.87 = private unnamed_addr constant [23 x i8] c"java/lang/LinkageError\00", align 16
@.tmr.88 = private unnamed_addr constant [31 x i8] c"java/lang/NoClassDefFoundError\00", align 16
@.tmr.89 = private unnamed_addr constant [31 x i8] c"java/lang/NullPointerException\00", align 16
@.tmr.90 = private unnamed_addr constant [17 x i8] c"java/lang/Number\00", align 16
@.tmr.91 = private unnamed_addr constant [39 x i8] c"java/lang/ReflectiveOperationException\00", align 16
@.tmr.92 = private unnamed_addr constant [28 x i8] c"java/lang/StackTraceElement\00", align 16
@.tmr.93 = private unnamed_addr constant [40 x i8] c"java/lang/UnsupportedOperationException\00", align 16
@.tmr.94 = private unnamed_addr constant [25 x i8] c"mono/android/TypeManager\00", align 16
@.tmr.95 = private unnamed_addr constant [35 x i8] c"crc64fdf5be6716f4b455/MainActivity\00", align 16
@.tmr.96 = private unnamed_addr constant [46 x i8] c"crc64fdf5be6716f4b455/MainActivity_PageClient\00", align 16
@.tmr.97 = private unnamed_addr constant [25 x i8] c"senatenight/ScoreService\00", align 16
@.tmr.98 = private unnamed_addr constant [20 x i8] c"[Ljava/lang/Object;\00", align 16
@.tmr.99 = private unnamed_addr constant [3 x i8] c"[Z\00", align 1
@.tmr.100 = private unnamed_addr constant [3 x i8] c"[B\00", align 1
@.tmr.101 = private unnamed_addr constant [3 x i8] c"[C\00", align 1
@.tmr.102 = private unnamed_addr constant [3 x i8] c"[S\00", align 1
@.tmr.103 = private unnamed_addr constant [3 x i8] c"[I\00", align 1
@.tmr.104 = private unnamed_addr constant [3 x i8] c"[J\00", align 1
@.tmr.105 = private unnamed_addr constant [3 x i8] c"[F\00", align 1
@.tmr.106 = private unnamed_addr constant [3 x i8] c"[D\00", align 1
@.tmr.107 = private unnamed_addr constant [37 x i8] c"net/dot/jni/internal/JavaProxyObject\00", align 16
@.tmr.108 = private unnamed_addr constant [40 x i8] c"net/dot/jni/internal/JavaProxyThrowable\00", align 16
@.tmr.109 = private unnamed_addr constant [24 x i8] c"net/dot/jni/ManagedPeer\00", align 16

;TypeMapModule
@.TypeMapModule.0_assembly_name = private unnamed_addr constant [20 x i8] c"SenateNight.Android\00", align 16
@.TypeMapModule.1_assembly_name = private unnamed_addr constant [13 x i8] c"Mono.Android\00", align 1
@.TypeMapModule.2_assembly_name = private unnamed_addr constant [13 x i8] c"Java.Interop\00", align 1

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
