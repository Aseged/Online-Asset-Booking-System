create table tblStaff
(
StaffID varchar (30) not null,
StaffName varchar(50) not null,
);

alter table tblStaff add constraint PK_tblStaff primary key (StaffID);

				insert into tblStaff
				(
				StaffID, StaffName
				)
				values
				(
				'awoldeselassie', 'Aseged Woldeselassie'
				);

				insert into tblStaff
				(
				StaffID, StaffName
				)
				values
				(
				'cpearson', 'Chris Pearson'
				);

				insert into tblStaff
				(
				StaffID, StaffName 
				)
				values
				(
				'tneath', 'Tony Neath'
				);

				insert into tblStaff
				(
				StaffID, StaffName
				)
				values
				(
				'jbennett', 'John Bennett'
				);






create table tblAssets 
(
AssetID int not null identity (1,1),
ARNumber nchar (10) null,
Asset varchar(100) not null,
Images varchar(100) null,
Descriptions varchar(500) not null, 
Campus varchar(10) not null,
ObtainMethod varchar(20) not null,
TimeOfEntry datetime null default current_timestamp
);
ALTER TABLE tblAssets ADD CONSTRAINT PK_tblAssets PRIMARY KEY (AssetID);


				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Projection Screen 1', 'Image\Screen.jpg', 'A projection screen suitable when a white board room mounted projection screen is not available.', 'Evesham', 'Delivery' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Projection Screen 2', 'Image\Screen.jpg', 'A projection screen suitable when a white board room mounted projection screen is not available.', 'Evesham', 'Delivery' 
				);
				
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Tripod 1', 'Image\Tripod.jpg', 'A tripod suitable for mounting Digital Cameras or Camcorders.', 'Evesham', 'Delivery' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Tripod 2', 'Image\Tripod.jpg', 'A tripod suitable for mounting Digital Cameras or Camcorders.', 'Evesham', 'Delivery' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Portable TV and VHS unit', 'Image\Xpr14.jpg', 'Mainly used for demos out of college. Collection only.', 'Evesham', 'Collection' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Goodman TV ,Video and DVD', 'Image\Goodmanstvd32100.jpg', 'TV with DVD and Video player. NOTE this unit can only be booked if TV and video is unavailable in the block where you are teaching.', 'Evesham', 'Delivery' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Laptop Computer', 'Image\Ilt1.jpg', 'Laptop computer with wireless access. NOTE for classroom use only.', 'Evesham', 'Delivery' 
				);
				
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Olympus Camera', 'Image\Olympusc350.jpg', 'Digital still camera comes with rechargeable batteries and USB  cable. NOTE some technical experience is required with this unit.', 'Evesham', 'Delivery' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Panasonic Digital  camcorder', 'Image\Panasonicgs520eb.jpg', 'Digital Camcorder comes with charger. NOTE this unit requires mini DV tapes.', 'Evesham', 'Delivery' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Panasonic Analogue Camcorder', 'Image\Panasonicm50.jpg', 'Analogue Camcorder comes with charger NOTE this unit requires VHS tapes.', 'Evesham', 'Delivery' 
				);
				
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', '2nd Floor TV ,Video and DVD.', 'Image\ablock2nd.PNG', 'A TV with a DVD and VHS tape player. This may be found in 2nd Floor corridor or one of the Classrooms do not forget to look in A33 (Through A32).', 'Evesham', 'Collection' 
				);
				
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'C Block TV ,Video and DVD', 'Image\cblock.PNG', 'A TV with a DVD and VHS tape player. C Block Video is kept in the C Block Corridor', 'Evesham', 'Collection' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'D Block TV ,Video and DVD', 'Image\dblock.PNG', 'A TV with a DVD and VHS tape player. D Block Video is kept in the D Block Corridor', 'Evesham', 'Collection' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'K Block TV and Video', 'Image\kblock.PNG', 'A TV with a VHS tape player.', 'Evesham', 'Collection' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'A Block Laptop Trolley', 'Image\ablock.PNG', 'For A block laptop trolley. Only For use in A block. This resource requires a key for use. Collection ONLY', 'Evesham', 'Collection' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'B Block Laptop Trolley', 'Image\bblocktrolley.PNG', 'For B block laptop trolley. Only For use in A block. This resource requires a key for use. Collection ONLY', 'Evesham', 'Collection' 
				);
				
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Optoma ES526', 'Image\optomaES526.PNG', 'A lightweight data projector good for use off site', 'Evesham', 'Delivery' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Epson EMP-83', 'Image\EpsomEMP-83.PNG', 'Data projector for the display PC feeds', 'Evesham', 'Delivery' 
				);
				
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Large PC speakers', 'Image\pcspeakers.png', 'Required if you wish to use sound within your presentation.For the PC connection.', 'Evesham', 'Delivery' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'PA speaker', 'Image\Paspeaker.png', 'Required if you wish to make your voice louder in your presentation. This unit can come with wireless hand held microphone or headset.', 'Evesham', 'Delivery' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Fuji Digital camera A820', 'Image\fujia820.png', 'Digital Camera', 'Evesham', 'Collection' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Sony Bloggie Sport', 'Image\bloggie.png', 'Hand held video capture device, for the recording of video for live playback in class. Requires desktop or laptop for playback. Collection only.', 'Malvern', 'Collection' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Targus remote mouse and pointer', 'Image\photo.jpg', 'Targus remote mouse and pointer', 'Evesham', 'Collection' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Main Build First TV ,Video and DVD', 'Image\mainmalv1st.PNG', 'A TV with a DVD and VHS tape player. If the remote is needed, please collect from the Art Staff Room', 'Malvern', 'Collection' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Main Build Ground TV ,Video and DVD', 'Image\mainmalv.PNG', 'A TV with a DVD and VHS tape player.', 'Malvern', 'Collection' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'New Build 1 TV ,Video and DVD', 'Image\newbuilding.PNG', 'A TV with a DVD and VHS tape player.', 'Malvern', 'Delivery' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'New Build 2 TV ,Video and DVD', 'Image\newbuilding2.PNG', 'A TV with a DVD and VHS tape player.', 'Malvern', 'Collection' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'OLYMPUS C2040 Camera', 'Image\olympus.PNG', '-', 'Evesham', 'Delivery' 
				);
				
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Tripod', 'Image\Tripod.jpg', 'A tripod suitable for mounting Digital Cameras or Camcorders.', 'Malvern', 'Collection' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Lenovo G530 Laptop', 'Image\lenovo_g530-221.jpg', 'Lenovo G530 Laptop Can be booked out for Staff Use only.', 'Malvern', 'Collection' 
				);
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Optoma projector', 'Image\optima.png', 'Optoma EX615 projector Portable Data Projector comes with VGA cable and mat.', 'Malvern', 'Collection' 
				);
				
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Projection screen', 'Image\Screen.jpg', '-', 'Malvern', 'Collection' 
				);
				
				insert into tblAssets
				(
				ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod
				)
				values 
				(
				'', 'Sony Bloggie Sport', 'Image\bloggie.png', 'Hand held video capture device, for the recording of video for live playback in class. Requires desktop or laptop for playback. Collection only.', 'Evesham', 'Collection' 
				);
				
				

				
				
				
				
				
				
				
				
				
				
				
				

create table arcvRecord 
(
RecordID int not null identity (1,1),
AssetID int  not null,
ARNumber nchar(10) not null,
Asset varchar(50) not null,
Images varchar(50) null,
Descriptions varchar(250) not null, 
Campus varchar(10) not null,
ObtainMethod varchar(20) not null,
TimeOfEntry datetime null default current_timestamp
	
);
ALTER TABLE arcvRecord ADD CONSTRAINT PK_arcvRecord PRIMARY KEY (RecordID);



				
				
				
create table tblBooking

(
BookingID int not null identity (1,1),
StaffID varchar (30) not null,
AssetID int not null,
StartDate date not null,
EndDate date not null,
StartTime time(0) not null,
EndTime time(0) not null,
Location varchar(20) not null,
Messege varchar(max) null,
Arrengement varchar(20) not null,
TimeOfBooking datetime not null default current_timestamp
);

ALTER TABLE tblBooking ADD CONSTRAINT PK_tblBooking PRIMARY KEY (BookingID) ;
alter table tblBooking add constraint tblBooking_tblStaff foreign key (StaffID) references tblStaff(StaffID) on delete cascade on update cascade;
alter table tblBooking add constraint tblBooking_tblAssets foreign key (AssetID) references tblAssets(AssetID) on delete cascade on update cascade;

				



create table tblCampus
(
CampusID int not null identity (1,1),
Campus nchar(10) not null,

);

alter table tblCampus add constraint PK_tblCampus primary key (CampusID);

insert into tblCampus
			(
			Campus
			)
			Values 
			(
			'Evesham'
			)
			
			insert into tblCampus
			(
			Campus
			)
			Values 
			(
			'Malvern'
			)
			
			
create table tblROOMS
(
Room nchar(30) not null,
Campus nchar(50) not null,

);
ALTER TABLE tblROOMS ADD CONSTRAINT PK_tblROOMS PRIMARY KEY (Room);


			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'A19', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'A20', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'A22', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'A23', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'A24', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			 'A25a', 'Evesham'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'A26', 'Evesham'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'A27', 'Evesham'
			)
			
						insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'A29', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'A30', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'A31', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'A32', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'A33', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			 'A34', 'Evesham'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'ABIActivity', 'Evesham'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'ABIIT', 'Evesham'
			)
			
						insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'ABIResource', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'A13ABISeminar', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'Art1', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'Art2', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			 'B1', 'Evesham'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'B2', 'Evesham'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'B3', 'Evesham'
			)
			
						insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'B4', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'B5', 'Evesham'
			)
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'B6', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'B7', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'B8', 'Evesham'
			)
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'B9', 'Evesham'
			)
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'B10', 'Evesham'
			)
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'B11', 'Evesham'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'B11a', 'Evesham'
			)
			
						insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'B12', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'B13', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'B14', 'Evesham'
			)
			
			
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'C1', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'C2', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			 'C3', 'Evesham'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'C4', 'Evesham'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'C5', 'Evesham'
			)
			
						insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'D1', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'D2', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'D3', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'D4', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'D5', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			 'D6', 'Evesham'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'D7', 'Evesham'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'EnCtr', 'Evesham'
			)
			
						insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'Gas1', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'Gas2', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'JVCE1', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'JVCE2', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'K1', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			 'K2a', 'Evesham'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'K2b', 'Evesham'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'LC1', 'Evesham'
			)
			
						insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'LC2', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'MV01', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'MV02', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'MV03', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			'OffSite1', 'Evesham'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			 'OffSite2', 'Evesham'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'OffSite3', 'Evesham'
			)
			
			
			
			
			
			
			
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'Art Studio', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'Beauty1', 'Malvern'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			 'Beauty2', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			'Design', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values
			(
			'Hair', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'Interview', 'Malvern'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			 'IT1', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			'IT2', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'Jacob', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'Life', 'Malvern'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			 'Life Skills', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			'Malvern OffSite1', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values
			(
			'Malvern OffSite2', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'MCLC', 'Malvern'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			 'MLRC', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			'Pottery', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'PracticeRoom', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'Room1', 'Malvern'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			 'Room2', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			'Seminar1', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values
			(
			'Severn', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'Silversmithing', 'Malvern'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			 'Teme', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			'Theory', 'Malvern'
			)
			
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values
			(
			'Wells1', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			 'Wells2', 'Malvern'
			)
			
			insert into tblROOMS
			(
			Room, Campus
			)
			Values 
			(
			 'Wye', 'Malvern'
			)
			
			insert into tblROOMS
			(
			 Room, Campus
			)
			Values 
			(
			'YouthCentre', 'Malvern'
			)

