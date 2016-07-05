USE [master]
GO
/****** Object:  Database [ToDo]    Script Date: 7/5/2016 11:22:55 AM ******/
CREATE DATABASE [ToDo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ToDo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ToDo.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ToDo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ToDo_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ToDo] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToDo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToDo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToDo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToDo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToDo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToDo] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToDo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ToDo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToDo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToDo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToDo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToDo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToDo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToDo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToDo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToDo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ToDo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToDo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToDo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToDo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToDo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToDo] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ToDo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToDo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ToDo] SET  MULTI_USER 
GO
ALTER DATABASE [ToDo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToDo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToDo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToDo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ToDo] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ToDo]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/5/2016 11:22:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/5/2016 11:22:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/5/2016 11:22:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/5/2016 11:22:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/5/2016 11:22:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/5/2016 11:22:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Todo]    Script Date: 7/5/2016 11:22:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Todo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[IsComplete] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Todo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201607012307291_InitialCreate', N'ToDo.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E3FC0F90F829E7A0E522B97B38B6D60EF2275929EA09B0BD6D9A26F0B5AA21D61255295A83441D15FD687FEA4FE850E254A9678D1C5566CA72850ACC5E137C3E1901C8E3EE5AF3FFE1C7F780A03EB11C7894FC9C43E1A1DDA16262EF57CB29CD8295B7CFBCEFEF0FEDFFF1A5F78E193F5532177C2E5A0274926F60363D1A9E324EE030E51320A7D37A6095DB0914B430779D4393E3CFCCE393A723040D8806559E34F29617E88B31FF0734A898B2396A2E09A7A3848C473689965A8D60D0A711221174FEC7B7A4E47B9986D9D053E0213663858D816228432C4C0C0D3CF099EB19892E52C820728B87F8E30C82D50906061F8E94ABCEB180E8FF9189C55C702CA4D1346C39E804727C2298EDC7D2DD7DAA5D3C06D17E05EF6CC479DB96E625F79387BF48906E00059E1E93488B9F0C4BE2E559C25D10D66A3A2E32887BC8C01EE571A7F1D55110FACCEFD0ECA203A1E1DF2FF0EAC691AB034C613825316A3E0C0BA4BE781EFFE889FEFE9574C262747F3C5C9BB376F9177F2F67FF8E44D75A4305690AB3D804777318D700CB6E145397EDB72EAFD1CB963D9ADD227F70AC412AC07DBBA464F1F3159B2075829C7EF6CEBD27FC25EF14404D767E2C3F2814E2C4EE1E74D1A04681EE0B2DD69D4C9FFDFA0F5F8CDDB41B4DEA0477F994DBDA41F164E0CEBEA130EB2D6E4C18FF2E5559BEF2F42EC32A621FF5D8FAFBCF5CB8CA6B1CB07438D22F7285E6256B76EECAC82B7534873A8E1C3BA40DDFFD0E696AAE1AD15E5035A6725142AB6BD1A0A7B5F566FE7883B8B2298BC2CB4B8479A02AE724A8DA46E07166F5C05CB51D7602130887FF2DE7711223F1860F3EBA005128E851F87B81CE5F714420D91DE36DFA12481B5EFFD1F250F0DA6C33F07307D86DD3486909C3114462FAEEDEE81127C9386731EE9DBD335D8D4DCFF4A2F91CB687C4178AF8DF13E52F72B4DD905F1CE11C39F995B00F29FF77ED81D601073CE5C1727C9250433F6A614F2E902F08AB093E3DE707C67DA75F2310D901FEAB30F690FFD5288AE3210BD84928518C474994893A91FE9D227DD4C2D44CDA6E612ADA60AB1BEA672B06E960A49B3A19940AB9DB9D460B95D3643C3277719ECFE67779B1DDEA6BDA0E2C619EC90F8074C700CDB98778718C33159CD40977D6317C942367D5CE98B9F4D99A69F50900EAD6AADD5906D02C3AF860C76FF574366263C7EF43D9E9574B8F214C200DF495E7F9B6A5F739265DB5E0EB5616E5BF976F600D372394B12EAFAD92AD014BB44A9A26E3FE470567BDD221F8D5CFB808141A0FBFCC8832730365B0EAA5B728E03CCB075E6E6C5C0294A5CE4A96E8401793D0C2B4E548D61AB1A48DDB8FF2A3A21D271CC3B217E094A60A5FA84A9CBC227AE1FA1A0D54B52CF8E47181F7BA9436E39C711265C61AB27BA28D7973CB801A51E6952DA3C34762A11D71C8886ACD534E76D29EC6ADE954AC45662B2257736C4A5C8DF5E24309B3DB685E06C764917038CE5BB5D04A8B8AB740D00F9E2B26F012ADD980C012A52AAAD0468DD633B08D0BA4B5E5D80E657D4AEF32FDD57F72D3CEB17E5ED1FEB8DEEDA416CD6FCB167A199E79ED087410F1CABE1793EE78DF889692E6760A7B89F2522D595438483CF30AB976C56F9AE360F759A41E4206A025C055A0BA878F1A700290BAA8771452DAFD13A9145F4802DEA6E8DB062EF97602B31A062575F805604CDAF49E5E0EC74FB284756468312E49D2E0B151C4D40C89B577DE01D9C62AACBAA8EE9920BF7C9862B031393D1E0A096CCD5E0A46230837BA908CD762FE912B23E29D9465E92D22783978AC10CEE2511A3ED4ED224053DD2828D5C543FC2075A6C45A5A33C6DCAB6B19313A2C483B163604E8DAF5114F9645961528927D62CA7514DBF9DF5A719853986E3261AB651696DA989D1182DB1D40AAAC1D24B3F4ED83962688E789D67EA858A98F66C356CFF85CAEAF1A94E62710E14D2FCDFE25D61E5757DED9055B310D1F9128616F25426AB9F6B265EDFDDE2943614A05853B29FD2200D8939B332F7CE5FDC55FBE74F5484B123D9AF644E8A9B94FCB6EEF34E33A2AE864D67A7CC58D69F213384C9CF45BE59F5B4290735A31425A92A8AA94CB5B31933A52EDD66494E07FB4F522BC2CBAC24C141A90288473D312A340605ACD2D61DB5CE34A962D65BBA234A74922AA4D4D4C3CA2A69A46664B5612D3C8347F512DD35A834912ABADADA1D594318A9426B9AD7C0D6D82CB77547D5704AAAC09AE6EED82B8289BC7BEEF15965BCA4F43FACF20BEC66A79501E365B6C2610EBBCA7BFA2A50E5714F2CF1265E0113CFF7328C8CB7B8FE6194172C360B23038679AFA9BDDAAE6F358DEFE3CD98B5F7D5B5EDBCE97DBD19AF5FB0BE684828B73759A4D45EDEE2A4DBDA58DC9CDA3F8651AE52B9886D156E84A3FC3961381C7181D1EC97601AF8986FDC85C03522FE02272CE768D8C78747C7D26735FBF3898B93245EA0B9799ABE73A9CFD916E856E411C5EE038A55F2C3069F81AC4095BAF215F1F0D3C4FE2DEB759A9528F8BFB2C707D655F299F8BFA4D0701FA7D8FA5D25730E438B6FBE4FEDE9470CDDBD7AF5F397BCEB81751BC38A39B50E255FAE33C3F54F1B7A599377DDC09AB53F7878BD0BAAF66D8116555A10EB7F4A30F7D9209F1114567E13A2A7FFF4354DFBA9C046889ACF0186C21BC48526BAFF3A5846AABF073F5946F5EF37583DF57F1DD38CB47F9FF4079349FFDDB7A1A2E70E8F1ACD65681B5B52E6E756D2F4460CCA5D9F4D0AB77AA385AEF2A77BC06DC0915E23325E19BD78B0D351C31E1E0C7B97A1FDE294E17D6109AFF81BBB25076F930FDCF006E81F4503DE03E29A8688B37BB2EFB663CD54C0DD73C6643F4AEF9E059BA067ED9EB8BBED60339579F73CD87AD173F72CD676757EEE38D23A1FA13B27DBAABC21C38B185D2DB88D4C9B17CEE1863FA710047946997F03A9676F35314F5B14AE44CC4ACDB43159B1B27014BD8A44B3DA7E6315077EE360854CB35A03D9B249B7D8FF1B750B9966DD060AE32E68C05A12A18E9ADDB28F35F19D5E13EDB736921696795BCEDAF856FD35B17C07714A6DF518DE11BF1E52EF202E1972E9F420F1AAAF7BE1ECACFC854438BF137FB982E07F2F9160B7766A96325764418BC35BB2A810912A34D798210F8ED4B398F90BE43268E635E6EC23EEAC6EC7DF74CCB177456E5316A50C868CC379502B78F124A0497FC654AEDB3CBE8DB2BF4732C410C04C9FD7E66FC9F7A91F78A5DD979A9A9001826717A2A2CBE792F1CAEEF2B944BAA1A42390705F9914DDE3300A002CB92533F488D7B10DC2EF235E22F77955013481B44F44DDEDE3731F2D6314260263D51F7E420C7BE1D3FBBF01EE34969F28540000, N'6.1.3-40302')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201607022135324_AddedToDoModel', N'ToDo.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B8157E2FD0FF20E8A92DB2562E9DC134B07791759236E8E482B167D1B7012DD18E3012A915A96C82A2BFAC0FFD49FD0B2575E74D175BB6956281C5983CFCCEE1E147F2903ACC7FFFFD9FE94FAF6160BDC098F818CDECB3C9A96D41E462CF479B999DD0F50F9FEC9F7EFCFDEFA6375EF86AFD52C85D7039D6129199FD4C6974E938C47D86212093D077634CF09A4E5C1C3AC0C3CEF9E9E95F9CB3330732089B6159D6F44B82A81FC2F407FB39C7C885114D40708F3D1890BC9CD52C5254EB01849044C085337B89AFF12413B3ADABC007CC84050CD6B60510C2145066E0E557021734C668B388580108966F1164726B1010981B7E598977EDC3E939EF8353352CA0DC84501CF6043CBBC89DE2C8CDB772AD5D3A8DB9ED86B997BEF15EA7AE9BD9771E4C8BBEE08039405678390F622E3CB3EF4B1557247A807452349C6490B73183FB0DC7DF2775C413AB73BB939244E79353FEDF89354F029AC47086604263109C584FC92AF0DDBFC3B725FE0ED1ECE26CB5BEF8F4E123F02E3EFE195E7CA8F794F595C90905ACE829C6118C996D705DF6DFB61CB19D23372C9BD5DA645E615C62F3C1B6EEC1EB678836F499CD94F34FB675EBBF42AF28C9C9F515F96CFAB046344ED8CF872408C02A8065BDD3A893FFBF41EBF9878F83687D002FFE261D7A493F9B38319B575F6090D692673FCAA69730DEDF72B1DB1887FCB7C8AFACF6DB0227B1CB3B838D224B106F2015AD9B3A15793B519A430D4FEB0275FCD4E696AAF4D68AF20E6D33130A15879E0D85BDFBD5DB99714BECE12696D5B6A609973DB17849458BB3AEB440CCDCC3AF7277885E9C6B7C55EBEA82E218FE152218030ABD2740298C513515DBC6F31A1237F6A36C8F6B58E43EEC834C77648EC32880B45C607FC68C5F000D458FAB286283983A8A4F98AE4C919ABD33D21C6E31B809811F0CB03776D0C2E2D1B51F87D0EBC71415ED0910C2B606EF6F803C3798CEFE3980E90BE82631A3E4828230DABBB6A7678CE04312AE38D30FA76BB0A159FE866F81CBD6B31BC45BED8CF719BBDF71426F9077CDD6C6AFD42D00F9CFA51F760718C49C2BD78584DC3232436F8ED971AB6D956F86E32BD3B163D37900FC501F9C4A6BE8B742B40A50F5124A906A10D305AA4DA67EC61B1F7533B510359B9A49B49A9A8BF535958375B33497341B9A0AB4DA99490D16FAA723347CEC9FC28E3FF81F7BC477AC93433A7C5CE9DEF7A654D32F20488656B5D56C481781E167430A3BFED9909AC98A5F7C8F47251D4EC4853083EF24AF3F6CB7CF39C9B2434F07A19B87567E9835C0345DAE08C1AE9FCE02CD5D687E9325DACF6238ABFD5A2BEB8D7C35C63AC688EEF32D8F95B0BED932A91ED135E4A750EBCACDEE8AE780B8C053DDC83AE4F530ACD8513586555764A2717F527432A6C3983702FC1044D84CF51155A7858F5C3F0241AB97A4961DB730DEF752875C730D2388B8C2564F7451AEBF11E306947AA44169F3D0D4A931AE998886A8D534E66D216C35EECA4DC44138D9123B1B7899C76F7B2166B3C70E40CE66977431C078BB7B0C82E66795AE04900F2E6323A874623210340FA90E4250D1634720A8E8927747D0EC88DA75FCA5F3EAD8E8291E940FBFAD37BAEB08DC14FC31326A66B1276B43590B18ABF4BC5EF14AF84A35873366677E3E2379A82B5384832F2015AF6CAA78571B873ACD2032899A002BA2B580F2AF5E3AA0ECCB594BE3FCA3B2D258998D3D7A565C0436762D0F417AC01697768DB0F9C621C1D608A462D73FAED704CD9FE06566773ABA943D2BA9A4CC904E278D1A8E864DF2CA2776BC83534C97BAAA63BA04D27D42E95AC7F2C16870504BD86B7052D199C1BD5450B3DD4BBA68AE4F3CB79397A4D8CBE0A5A233837B29E768BB933411458F9862271789FBFF4093ADB82629B7AAB26EEA64C97679C1D43164E54DEF4114F96853CBD2CB4BAC4596A237FF61D13F852DCC301C976832D94A6B4B4D14C76003A55AA69A597AEBC7845E030A56805F12CDBD5011D36ECC86E5BF5059DF7BD5412CF681429AFFBBD813AB6FFDC20EAD863079E35BD6B590C741E9E5BB66E0F5CD2D9E2E0902106BEEFBE7384842640ECBCCADB3AF7EF5F659898A307524FB95B04B7193121C8B3EEF3422EA6CD87574CA7067FB11324398FC5C04AB754F9B0258334A719F554731DD711D6DC4B22871DB514A63C9FE23A36FB69F3923E439D561848AEE78F5D425C1AA5AF96846D71498761B5D39D8EF3FD0AD08FB19F33C3DA90E9017F5C4A865B82860B5BAEEA86212521D53ACE98E28651AD521A5AA1E56D6F3890423EB155BE1193CAA97E8AE41CD20AAA3ABB5DD9135B94475684DF516D81A9BE5BAEEA89A74A33AB0A6BA3B76957B24EF8D238E448C47D0FEA148763DB15B2C62C0D8CF52384C28534BE1A803D58A7B62E5491A0A585E3E4A1A19CFE8FD69945D47ED4623038679AD11B21EC4A5A63155C38C29A43208CB79532A8719AF1F59F74A09E56C2E8B94DACB33BA74169FE6E7E2F66774CA413913B1ADC28D6C2B7F231486132E3059FC1ACC031FF285BB10B807C85F4342B3F41DFBFCF4EC5C7A90379EC7710E215EA0B95730BD9013C7EC009978E805C4EE3388D5BC981D1E9055A0CA27873BE4C1D799FDCFB4D5657A01C5FF95169F5877E42BF27F4D58C5324EA0F52F35CF77981713CDA7E5913E7FEAEED5BB7F7CCB9A9E588F319B3197D6A9E4CB6D46587C14D5CB9AACE90ED6F47B2A75F059E4F3F5A93563B5A7BF358F96B4B3357DB6B4F39BA4954FF7F51EE9FD2E6AC2D31F83F3854569FB973EEDFE579174AF7C0A2BFF1082D73FF6354DFB92672744CD6B9DA1F00671A1E935CE3658C697381EFB49D39738FD3AAB7F99B38D69C65739E9CAB5E39B9CEE5B41D1F288DBBDE640FA6E778871C507CAD3879D26BAFABCA107DC0E4F18B660C63BCBFE1F6C77D424F70F867D4C6AEF3DA37F2C49FC557AD57173F70F99AEDFF08DF5FF2A4B7F0479A59A54B7E3E7E21F9A6BA64BF4912734F7CBB81F19D9F204C8E3E7D51F9A6CA6ABF69193AD57F6FCC8B876ACFDF3C84CEBBC851E3D175ECDCC9387559F6E9D8D5D15096AC3B5ECE3053BE1AF3023411651664F94F5F991266515598C0A2B11B3527362A6AC384B8C579465C53A059D32E995E9A82850249A3BD3CF837918D1E8C25CA659AD2149BA4977BEAB34EACE659A751B528F8F91BEAF4DFED5BDC768591D9BF214DF53BABED09396D7216D917063BEC47BCACE1FC429C2EC317CFD7F3FC9F883B864C8A9D323F95EFD90CF76E4DA5FCD655101F1371504FF1BBA08BAC25E5CCADCA1352E4202C9A24244BAF7B98714786CA3BE8AA9BF062E65D5FCE63AFDCB0DE96D20FF7EB282DE1D7A4C689450D66518AE02E11A8D87164DFAD31706A2CDD3C7F43B1B19A20BCC4C9FDFF83FA29F133FF04ABB6F35374D06081EB3E4F7C47C2C29BF2FDEBC95480F187504CADD57865A4B18460103238F68015EE036B631FA7D861BE0BE55F78A2690F68110DD3EBDF6C1260621C931AAF6EC27E3B017BEFEF83FBCBAFB123C5A0000, N'6.1.3-40302')
GO
SET IDENTITY_INSERT [dbo].[Todo] ON 

GO
INSERT [dbo].[Todo] ([Id], [Description], [IsComplete]) VALUES (99, N'Do the dishes', 1)
GO
INSERT [dbo].[Todo] ([Id], [Description], [IsComplete]) VALUES (100, N'Do the laundry', 1)
GO
INSERT [dbo].[Todo] ([Id], [Description], [IsComplete]) VALUES (101, N'Make a sandwish', 0)
GO
INSERT [dbo].[Todo] ([Id], [Description], [IsComplete]) VALUES (102, N'Walk the dog', 0)
GO
INSERT [dbo].[Todo] ([Id], [Description], [IsComplete]) VALUES (103, N'Feed the cat', 0)
GO
SET IDENTITY_INSERT [dbo].[Todo] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/5/2016 11:22:56 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 7/5/2016 11:22:56 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 7/5/2016 11:22:56 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 7/5/2016 11:22:56 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 7/5/2016 11:22:56 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/5/2016 11:22:56 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [ToDo] SET  READ_WRITE 
GO
