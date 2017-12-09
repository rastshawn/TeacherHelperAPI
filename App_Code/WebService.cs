using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

/// <summary>
/// Mike Stahr
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class WebService : System.Web.Services.WebService {

	#region ========================================================================================================================== Constants

	// These are just some variations of styles you could use for the web service page
	private const string description = "<div style='font-weight:bold;margin-bottom:20px;margin-top:5px;margin-left:20px;color:black;background-color:#d4d9de;border:solid 1px grey;padding:3px 3px 3px 3px;padding:10px;border-radius:5px;max-width:60%;box-shadow: 0 2px 2px 0 #C2C2C2;'>";
	private const string descriptionNew = "<div style='font-weight:bold;margin-bottom:20px;margin-top:5px;margin-left:20px;color:white;background-color:green;border:solid 1px grey;padding:3px 3px 3px 3px;padding:10px;border-radius:5px;max-width:60%;box-shadow: 0 2px 2px 0 #C2C2C2;'>(NEW) ";
	private const string descriptionUpdated = "<div style='font-weight:bold;margin-bottom:20px;margin-top:5px;margin-left:20px;color:black;background-color:pink;border:solid 1px grey;padding:3px 3px 3px 3px;padding:10px;border-radius:5px;max-width:60%;box-shadow: 0 2px 2px 0 #C2C2C2;'>(Updated) ";

	#endregion

	#region ========================================================================================================================== General Stuff / dB

	private string conn = System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
	private List<SqlParameter> parameters = new List<SqlParameter>();

	private DataTable doSqlExec(string sql, CommandType ct) {
		DataSet userDataset = new DataSet();
		try {
			using (SqlConnection objConn = new SqlConnection(conn)) {
				SqlDataAdapter myCommand = new SqlDataAdapter(sql, objConn);
				myCommand.SelectCommand.CommandType = ct;
				myCommand.SelectCommand.Parameters.AddRange(parameters.ToArray());
				myCommand.Fill(userDataset);
				parameters.Clear();
			}
		} catch (Exception e) {
			userDataset.Tables.Add();
			setDataTableToError(userDataset.Tables[0], e);
		}
		if (userDataset.Tables.Count == 0) userDataset.Tables.Add();
		return userDataset.Tables[0];
	}

	private DataTable sqlExec(string sql) {
		return doSqlExec(sql, CommandType.Text);
	}

	private DataTable spExec(string sql) {
		return doSqlExec(sql, CommandType.StoredProcedure );
	}

	// This method is used by the above method to insert an Error row if needed
	private void setDataTableToError(DataTable tbl, Exception e) {
		tbl.Columns.Add(new DataColumn("Error", typeof(String)));
		DataRow row = tbl.NewRow();
		row["Error"] = e.Message;
		try {
			tbl.Rows.Add(row);
		} catch (Exception) { }
	}

	// Simple method to serialize an object into a JSON string and write it to the stream
	private void serialize(Object obj) {
		streamJson(new JavaScriptSerializer().Serialize(obj));
	}

	// Streams out a JSON string
	private void streamJson(string jsonString) {
		Context.Response.Clear();
		Context.Response.ContentType = "application/json";
		Context.Response.Write(jsonString);
		Context.Response.Flush();
		HttpContext.Current.ApplicationInstance.CompleteRequest();
	}

	// A method that will take a DataTable and convert it into a Dictionary objects of rows.
	private void SerializeDataTable(DataTable dt) {
		List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
		Dictionary<string, object> row;

		row = new Dictionary<string, object>();
		foreach (DataRow dr in dt.Rows) {
			row = new Dictionary<string, object>();
			foreach (DataColumn col in dt.Columns)
				row.Add(col.ColumnName, dr[col]);
			rows.Add(row);
		}
		serialize(rows);
	}

	#endregion

	
    #region ========================================================================================================================== Web Methods
	/*
	[WebMethod(Description = description + "Sending a query to a dB... NOT a good method</span>")]
	public void vendorsByState(string state) {
		SerializeDataTable(sqlExec("SELECT * FROM Vendors WHERE VendorState = '" + state + "'"));
	}


	[WebMethod(Description = description + "Calling a Stored Procedure with parameters</span>")]
	public void vendorInvoicesByStateOrName(string vendorStateOrName, double minBalance) {
		parameters.Add(new SqlParameter("@vendorStateOrName", vendorStateOrName));
		parameters.Add(new SqlParameter("@minBalance", minBalance));
		SerializeDataTable(spExec("spVendorInvoicesByStateOrName"));
	}
	*/



    /*
		[WebMethod(Description = description + "_________________</span>")]
		public void _________________(____________) {
			parameters.Add(new SqlParameter("_____________", __________));
			SerializeDataTable(spExec("_______________"));
		}
	*/
    [WebMethod(Description = description + "This adds a student to a given class and generates a slip to draw out of the hat. </span>")]
    public void AddStudentToClass(int StudentID, int ClassID)
    {
        parameters.Add(new SqlParameter("@StudentID", StudentID));
        parameters.Add(new SqlParameter("@ClassID", ClassID));
        SerializeDataTable(spExec("spAddStudentToClass"));
    }

    [WebMethod(Description = description + "This creates a new teacher account.</span>")]
    public void AddTeacher(string fName,string lName,string username,string password ) {
	parameters.Add(new SqlParameter("@fName", fName));
	parameters.Add(new SqlParameter("@lName", lName));
	parameters.Add(new SqlParameter("@username", username));
	parameters.Add(new SqlParameter("@password", password));

    SerializeDataTable(spExec("spAddTeacher"));
}

[WebMethod(Description = description + "CRUD operations on classes.</span>")]
public void AddUpdateDeleteClass(int ClassID, string Name, int TeacherID, bool delete)
{
    parameters.Add(new SqlParameter("@classID", ClassID));
    parameters.Add(new SqlParameter("@name", Name));
    parameters.Add(new SqlParameter("@teacherID", TeacherID));
    parameters.Add(new SqlParameter("@delete", delete));
    SerializeDataTable(spExec("spAddUpdateDeleteClass"));
}


[WebMethod(Description = description + "CRUD operations on students.</span>")]
public void AddUpdateDeleteStudent(int StudentID, string fName, string lName,  bool delete)
{
    parameters.Add(new SqlParameter("@StudentID", StudentID));
    parameters.Add(new SqlParameter("@fName", fName));
    parameters.Add(new SqlParameter("@lName", lName));
   
    parameters.Add(new SqlParameter("@delete", delete));
    SerializeDataTable(spExec("spAddUpdateDeleteStudent"));
}

[WebMethod(Description = description + "This removes an attendance record.</span>")]
public void DeleteAttendance(int AttendanceID)
{
    parameters.Add(new SqlParameter("@AttendanceID", AttendanceID));
    SerializeDataTable(spExec("spDeleteAttendance"));
}

[WebMethod(Description = description + "This draws a given student from a hat that belongs to the given class.</span>")]
public void DrawStudentFromHat(int StudentID, int ClassID)
{
    parameters.Add(new SqlParameter("@StudentID", StudentID));
    parameters.Add(new SqlParameter("@ClassID", ClassID));
    SerializeDataTable(spExec("spDrawStudentFromHat"));
}

[WebMethod(Description = description + "This retrieves every class that a student is taking.</span>")]
public void GetClassesByStudent(int StudentID)
{
    parameters.Add(new SqlParameter("@StudentID", StudentID));
    SerializeDataTable(spExec("spGetClassesByStudent"));
}

    [WebMethod(Description = description + "This fetches the attendance records for a class on a given day.</span>")]
    public void GetAttendanceByClassAndDay(int ClassID, string Day)
    {
        DateTime newDay = DateTime.Parse(Day);
        parameters.Add(new SqlParameter("@ClassID", ClassID));
        parameters.Add(new SqlParameter("@Day", newDay));
        SerializeDataTable(spExec("spGetAttendanceByClassAndDay"));
    }

    [WebMethod(Description = description + "This retrieves every class that a given teacher is teaching.</span>")]
public void GetClassesByTeacher(int TeacherID)
{
    parameters.Add(new SqlParameter("@TeacherID", TeacherID));
    SerializeDataTable(spExec("spGetClassesByTeacher"));
}

[WebMethod(Description = description + "This returns a random name from the hat for a given class.</span>")]
public void GetNamesInHat(int ClassID)
{
    parameters.Add(new SqlParameter("@ClassID", ClassID));
    SerializeDataTable(spExec("spGetNamesInHat"));
}

[WebMethod(Description = description + "This gets everything that was assigned to a particular student on a given date.</span>")]
public void GetStudentAssignmentsByAssignDate(int StudentID, string AssignDate)
{
    DateTime newDate = DateTime.Parse(AssignDate);
    parameters.Add(new SqlParameter("@StudentID", StudentID));
    parameters.Add(new SqlParameter("@AssignDate", newDate));
    SerializeDataTable(spExec("spGetStudentAssignmentsByAssignDate"));
}


    [WebMethod(Description = description + "This gives a list of assignments for a given class..</span>")]
    public void GetAssignmentsByClass(int ClassID)
    {

        parameters.Add(new SqlParameter("@ClassID", ClassID));
        SerializeDataTable(spExec("spGetAssignmentsByClass"));
    }

    [WebMethod(Description = description + "This deletes an assignment.</span>")]
    public void DeleteAssignment(int AssignmentID)
    {

        parameters.Add(new SqlParameter("@AssignmentID", AssignmentID));
        SerializeDataTable(spExec("spDeleteAssignment"));
    }
    [WebMethod(Description = description + "This adds an assignment.</span>")]
    public void AddAssignment(string AssignmentName, int ClassID, string AssignDate)
    {
        DateTime newAssignDate = DateTime.Parse(AssignDate);
        
        parameters.Add(new SqlParameter("@AssignmentName", AssignmentName));
        parameters.Add(new SqlParameter("@ClassID", ClassID));
        parameters.Add(new SqlParameter("@AssignDate", newAssignDate));
        SerializeDataTable(spExec("spAddAssignment"));
    }

    [WebMethod(Description = description + "This returns a list of students that were both marked absent and present during the same day.</span>")]
    public void GetStudentsTemporarilyAbsent()
    {
        SerializeDataTable(spExec("spGetStudentsTemporarilyAbsent"));
    }

    [WebMethod(Description = description + "This returns every student with perfect attendance.</span>")]
    public void GetStudentsWithPerfectAttendance()
    {
        SerializeDataTable(spExec("spGetStudentsWithPerfectAttendance"));
    }

    [WebMethod(Description = description + "This returns every student and their number of absences, ranked.</span>")]
    public void GetAbsencesRank()
    {
        SerializeDataTable(spExec("spGetAbsencesRank"));
    }

    [WebMethod(Description = description + "This returns a list of all students in a given class.</span>")]
public void GetStudentsByClass(int ClassID)
{
    parameters.Add(new SqlParameter("@ClassID", ClassID));
    SerializeDataTable(spExec("spGetStudentsByClass"));
}

[WebMethod(Description = description + "This returns a list of all students that a given teacher teaches.</span>")]
public void GetStudentsByTeacher(int TeacherID)
{
    parameters.Add(new SqlParameter("@TeacherID", TeacherID));
    SerializeDataTable(spExec("spGetStudentsByTeacher"));
}

[WebMethod(Description = description + "This returns a list of all students marked absent on a given date, which defaults to the day this is accessed.</span>")]
public void GetStudentsMarkedAbsent(string date)
{
    DateTime newDate = DateTime.Parse(date);
    parameters.Add(new SqlParameter("@date", newDate));
    SerializeDataTable(spExec("spGetStudentsMarkedAbsent"));
}


[WebMethod(Description = description + "This returns the teacher that teaches a given class.</span>")]
public void GetTeacherByClass(int ClassID)
{
    parameters.Add(new SqlParameter("@ClassID", ClassID));
    SerializeDataTable(spExec("spGetTeacherByClass"));
}

[WebMethod(Description = description + "This returns a list of every teacher that teaches a given student.</span>")]
public void GetTeachersByStudent(int StudentID)
{
    parameters.Add(new SqlParameter("@StudentID", StudentID));
    SerializeDataTable(spExec("spGetTeachersByStudent"));
}

[WebMethod(Description = description + "checks a teacher username and password combination </span>")]
public void Login(string username, string password)
{
    parameters.Add(new SqlParameter("@username", username));
    parameters.Add(new SqlParameter("@password", password));
    SerializeDataTable(spExec("spLogin"));
}

[WebMethod(Description = description + "This removes a given student from a given class.</span>")]
public void RemoveStudentFromClass(int StudentID, int ClassID)
{
    parameters.Add(new SqlParameter("@StudentID", StudentID));
    parameters.Add(new SqlParameter("@ClassID", ClassID));
    SerializeDataTable(spExec("spRemoveStudentFromClass"));
}

[WebMethod(Description = description + "This puts all names back in a class' hat.</span>")]
public void ResetHat(int ClassID)
{
    parameters.Add(new SqlParameter("@ClassID", ClassID));
    SerializeDataTable(spExec("spResetHat"));
}


    [WebMethod(Description = description + "This updates an existing attendance record.</span>")]
    public void AddUpdateAttendance(int AttendanceID, int StudentID, int ClassID, string Day, bool isPresent)
    {
        DateTime newDay = DateTime.Parse(Day);
        parameters.Add(new SqlParameter("@AttendanceID", AttendanceID));
        parameters.Add(new SqlParameter("@StudentID", StudentID));
        parameters.Add(new SqlParameter("@ClassID", ClassID));
        parameters.Add(new SqlParameter("@Day", newDay));
        parameters.Add(new SqlParameter("@isPresent", isPresent));
        SerializeDataTable(spExec("spAddUpdateAttendance"));
    }

    [WebMethod(Description = description + "This adds or updates a teachers' notes on a student.</span>")]
    public void SetTeacherStudentNotes(int StudentID, int TeacherID, bool isTalkative, bool isNearsighted, string notes)
    {
        parameters.Add(new SqlParameter("@StudentID", StudentID));
        parameters.Add(new SqlParameter("@TeacherID", TeacherID));
        parameters.Add(new SqlParameter("@isTalkative", isTalkative));
        parameters.Add(new SqlParameter("@isNearsighted", isNearsighted));
        parameters.Add(new SqlParameter("@notes", notes));
        SerializeDataTable(spExec("spSetTeacherStudentNotes"));
    }

    [WebMethod(Description = description + "This fetches a teacher's notes on a student.</span>")]
    public void GetTeacherStudentNotes(int StudentID, int TeacherID)
    {
        parameters.Add(new SqlParameter("@StudentID", StudentID));
        parameters.Add(new SqlParameter("@TeacherID", TeacherID));
        SerializeDataTable(spExec("spGetTeacherStudentNotes"));
    }

    [WebMethod(Description = description + "This fetches a teacher by their username.</span>")]
    public void GetTeacherByUsername(string username)
    {
        parameters.Add(new SqlParameter("@username", username));
        SerializeDataTable(spExec("spGetTeacherByUsername"));
    }

    [WebMethod(Description = description + "Allows for updating or deleting an existing teacher account. </span>")]
public void UpdateDeleteTeacher(int TeacherID, string fName, string lName, string password, bool delete)
{
    parameters.Add(new SqlParameter("@TeacherID", TeacherID));
    parameters.Add(new SqlParameter("@fName", fName));
    parameters.Add(new SqlParameter("@lName", lName));
    parameters.Add(new SqlParameter("@password", password));
    parameters.Add(new SqlParameter("@delete", delete));
    SerializeDataTable(spExec("spUpdateDeleteTeacher"));
}

    [WebMethod(Description = description + "Returns a list of all students. </span>")]
    public void GetStudents()
    {
        SerializeDataTable(spExec("spGetStudents"));
    }


    #endregion


}
