--this trigger stops the deletion of a table

go

create trigger tblAssets
on database 
for drop_table 
as

begin
	print 'You dont have authority to delete tables'
	rollback transaction 
	return 
end

--trigger moves record from a table to archive folder when deleted 

go

create trigger arcvRecordDeleted
on tblAssets
instead of delete
as

begin
	
  INSERT into arcvRecord(AssetID, ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod ) 
  SELECT AssetID, ARNumber, Asset, Images, Descriptions, Campus, ObtainMethod FROM deleted;

  DELETE t FROM tblAssets AS t
    INNER JOIN deleted AS d
    ON t.AssetID = d.AssetID;
	
	print 'Record moved to Archive'
end



procedure


--select all booking for today 		
create procedure [procTomorrowBooking]
as
begin
SELECT B.BookingID as ID,
		S.StaffName as Name,
		A.Asset as Item,
		convert(varchar, B.StartDate, 103) as StartDate,
		convert(varchar, B.EndDate, 103) as EndDate,
		substring(CONVERT (varchar(30), B.StartTime, 121),1,5) as StartTime,
		substring(CONVERT (varchar(30), B.EndTime, 121),1,5) as EndTime,
		A.Campus,
		B.Location as Room,
		B.Arrengement,
		B.Messege
FROM tblBooking as B INNER JOIN tblAssets as A 
								 
		on B.AssetID = A.AssetID
		inner join tblStaff as S
		on B.StaffID = S.StaffID
WHERE StartDate = CONVERT(DateTime, DATEDIFF(DAY, 0, GETDATE()))
end	
--show tomorrow booking 
create procedure [procTomorrowBookingWarn]
as
begin
SELECT B.BookingID as ID,
		S.StaffName as Name,
		A.Asset as Item,
		convert(varchar, B.StartDate, 103) as StartDate,
		convert(varchar, B.EndDate, 103) as EndDate,
		substring(CONVERT (varchar(30), B.StartTime, 121),1,5) as StartTime,
		substring(CONVERT (varchar(30), B.EndTime, 121),1,5) as EndTime,
		A.Campus,
		B.Location as Room,
		B.Arrengement,
		B.Messege
FROM tblBooking as B INNER JOIN tblAssets as A 
								 
		on B.AssetID = A.AssetID
		inner join tblStaff as S
		on B.StaffID = S.StaffID
WHERE StartDate = CONVERT(DateTime, DATEDIFF(DAY, -1, GETDATE()))
end		
	
-- show all booking that are in the future 
create procedure [procFutureBooking]
as
begin
SELECT B.BookingID as ID,
		S.StaffName as Name,
		A.Asset as Item,
		convert(varchar, B.StartDate, 103) as StartDate,
		convert(varchar, B.EndDate, 103) as EndDate,
		substring(CONVERT (varchar(30), B.StartTime, 121),1,5) as StartTime,
		substring(CONVERT (varchar(30), B.EndTime, 121),1,5) as EndTime,
		A.Campus,
		B.Location as Room,
		B.Arrengement,
		B.Messege
FROM tblBooking as B INNER JOIN tblAssets as A 
								 
		on B.AssetID = A.AssetID
		inner join tblStaff as S
		on B.StaffID = S.StaffID
WHERE StartDate >= CONVERT(DateTime, DATEDIFF(DAY, 0, GETDATE()))
end
--show all booking that are in the past
create procedure [procPastBooking]
as
begin
SELECT B.BookingID as ID,
		S.StaffName as Name,
		A.Asset as Item,
		convert(varchar, B.StartDate, 103) as StartDate,
		convert(varchar, B.EndDate, 103) as EndDate,
		substring(CONVERT (varchar(30), B.StartTime, 121),1,5) as StartTime,
		substring(CONVERT (varchar(30), B.EndTime, 121),1,5) as EndTime,
		A.Campus,
		B.Location as Room,
		B.Arrengement,
		B.Messege
FROM tblBooking as B INNER JOIN tblAssets as A 
								 
		on B.AssetID = A.AssetID
		inner join tblStaff as S
		on B.StaffID = S.StaffID
WHERE StartDate <= CONVERT(DateTime, DATEDIFF(DAY, 0, GETDATE()))
end
--show all booking 

create procedure [procAllBooking]
as
begin
SELECT B.BookingID as ID,
		S.StaffName as Name,
		A.Asset as Item,
		convert(varchar, B.StartDate, 103) as StartDate,
		convert(varchar, B.EndDate, 103) as EndDate,
		substring(CONVERT (varchar(30), B.StartTime, 121),1,5) as StartTime,
		substring(CONVERT (varchar(30), B.EndTime, 121),1,5) as EndTime,
		A.Campus,
		B.Location as Room,
		B.Arrengement,
		B.Messege
FROM tblBooking as B INNER JOIN tblAssets as A 
								 
		on B.AssetID = A.AssetID
		inner join tblStaff as S
		on B.StaffID = S.StaffID
end
		
--select booking details for confirmation page to be emailed to user

create procedure [procNowBooking]
as
begin
	SELECT B.BookingID as ID,
		S.StaffName as Name,
		A.Asset as Item,
		convert(varchar, B.StartDate, 103) as StartDate,
		convert(varchar, B.EndDate, 103) as EndDate,
		substring(CONVERT (varchar(30), B.StartTime, 121),1,5) as StartTime,
		substring(CONVERT (varchar(30), B.EndTime, 121),1,5) as EndTime,
		A.Campus,
		B.Location as Room,
		B.Arrengement,
		B.Messege
FROM tblBooking as B INNER JOIN tblAssets as A 
								 
		on B.AssetID = A.AssetID
		inner join tblStaff as S
		on B.StaffID = S.StaffID
where B.TimeOfBooking >= dateadd(SECOND, -2, getdate())
and  B.TimeOfBooking <= dateadd(SECOND, -0, getdate())
end

--reminder for asset delivery or collection 15 minutes before 
create procedure [procStaffReminderBookingEnd]
as
begin
SELECT B.BookingID as ID,
		S.StaffName as Name,
		A.Asset as Item,
		convert(varchar, B.StartDate, 103) as StartDate,
		convert(varchar, B.EndDate, 103) as EndDate,
		substring(CONVERT (varchar(30), B.StartTime, 121),1,5) as StartTime,
		substring(CONVERT (varchar(30), B.EndTime, 121),1,5) as EndTime,
		A.Campus,
		B.Location as Room,
		B.Arrengement,
		B.Messege
FROM tblBooking as B INNER JOIN tblAssets as A 
								 
		on B.AssetID = A.AssetID
		inner join tblStaff as S
		on B.StaffID = S.StaffID
where B.EndTime < convert (time, dateadd(minute, 16, getdate() ))
and B.EndTime > convert (time, dateadd(minute, 10, getdate() ))
and B.EndDate = CONVERT(DateTime, DATEDIFF(DAY, 0, GETDATE()))
and B.Arrengement =     'Delivery' 
end

create procedure [procStaffReminderBooking]
as
begin
SELECT B.BookingID as ID,
		S.StaffName as Name,
		A.Asset as Item,
		convert(varchar, B.StartDate, 103) as StartDate,
		convert(varchar, B.EndDate, 103) as EndDate,
		substring(CONVERT (varchar(30), B.StartTime, 121),1,5) as StartTime,
		substring(CONVERT (varchar(30), B.EndTime, 121),1,5) as EndTime,
		A.Campus,
		B.Location as Room,
		B.Arrengement,
		B.Messege
FROM tblBooking as B INNER JOIN tblAssets as A 
								 
		on B.AssetID = A.AssetID
		inner join tblStaff as S
		on B.StaffID = S.StaffID
where B.StartTime < convert (time, dateadd(minute, 16, getdate() ))
and B.StartTime > convert (time, dateadd(minute, 10, getdate() ))
and B.StartDate = CONVERT(DateTime, DATEDIFF(DAY, 0, GETDATE()))
and B.Arrengement =     'Delivery' 
end

create procedure [procUserReminderBooking]
as
begin
SELECT B.BookingID as ID,
		S.StaffName as Name,
		A.Asset as Item,
		convert(varchar, B.StartDate, 103) as StartDate,
		convert(varchar, B.EndDate, 103) as EndDate,
		substring(CONVERT (varchar(30), B.StartTime, 121),1,5) as StartTime,
		substring(CONVERT (varchar(30), B.EndTime, 121),1,5) as EndTime,
		A.Campus,
		B.Location,
		B.Arrengement,
		B.Messege
FROM tblBooking as B INNER JOIN tblAssets as A 
								 
		on B.AssetID = A.AssetID
		inner join tblStaff as S
		on B.StaffID = S.StaffID
where B.StartTime < convert (time, dateadd(minute, -16, getdate() ))
and B.StartTime > convert(time, dateadd(minute, -15, getdate()) )
and B.StartDate = CONVERT(DateTime, DATEDIFF(DAY, 0, GETDATE()))
and B.Arrengement =     'Collection'
end

--this procedure pick asset from either evesham or malvern depending on the user login. 


create procedure [procAssetEveshamBooking]
as
begin
select ARNumber, Asset, Descriptions, ObtainMethod, Images
from tblAssets
where Campus='Evesham' and Campus='evesham';
end


create procedure [procAssetMalvernBooking]
as
begin
select ARNumber, Asset, Descriptions, ObtainMethod, Images
from tblAssets
where Campus='Malvern' and Campus='malvern';
end




--make 'collection only' assets unavailable if user choose delivery method 


--grey out unavailable asset for the time (booked message)



pages


--FOR USERS 
	--calendar/ my booking 
	--calendar 
		--Normal view --- view calendar  (normal calendar with link (eg. 4 BOOKINGS )to detailed date view)
		--detailed view 
	--my booking
		--detailed view of booking (cancel booking)
--FOR MANAGE
	--calendar / manage assets 	
	--calendar ---- view calendar  (normal calendar with link (eg. 4 BOOKINGS )to detailed date view)
			--allow same day booking (enter name or user name of staff, allow same day booking for a match)
			--show all future bookings
		--view today in detail 
			--delete booking (message to user, 'your booking has been cancelled by the administrator' with details) 
	--manage asset
		--add new asset
		--remove selected assets
	
messages 

--Unavailable (This asset is not available for the time/place you specified.)
--collection only (you must choose to collect this asset in order to book it.)
--same day asset booking is not authorised. Please contact your IT support team. 
--Sorry, we seem to be missing something. Please check the form and try again. 
--No asset is selected for booking. 		

calendar 

--only future dates are available for selection
--today must be available but cannot book without authorization 
--users should not be able to navigate into the past
--managers should have complete access to the calendar (past and future)
--past booking cannot be deleted (grey out delete buttons)
-- 