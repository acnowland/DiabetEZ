# Diabet-EZ

# The solution for easy diabetic glucose management

[![Diabet-Ez](http://img.youtube.com/vi/9i16ryhuWHs/0.jpg)](http://www.youtube.com/watch?v=9i16ryhuWHs "Diabet-Ez")

=====================
# Table of Content
* General Information
* Technologies Used
* Setup and Use
* Code Examples

* Work in progress 

====================

**_General Information_**

This is the current repo for Diabet-EZ. An easy-to-use glucose tracker for diabetic patients. This application was designed with a few things in mind,
most notably being patient compliance. The application offers a solution for patients to be able to input daily(or multiple) glucose measurements and in
return provide the patient with easily decipherable information based on those results. The results are translated into a scrollable line graph for trending,
a roughly calculated Hemoglobin A1C, and an estimated glucose average. This allows quick input times for the patient while giving the patient and their physician 
valuable information when a checkup is due. 


**_Technologies_**

* Xcode
* Swift
* SwiftUI
* Apple Authentication
* Anonymous Authentiation via Firebase
* Firestore


**_Setup_**

Setup for use outside of my actual project will be complicated due to the use of a cloud based storage option. The functions that are written, along with the
repository to bring in the information is based on Firestore's documentation; so I will refer to that for any database questions. Upon forking and cloning this 
repo though, you will need to build the app in Xcode and it will install the dependencies from firebase, firestore, and SwiftUICharts. To have a functional
application though, you will need to setup a firestore and download their files to place into your app as noted above. 

Useage of the application is much more simple. I do plan to have the application released to the app store in the near future. Upon download, you will not need to 
login. An ID will be formed based on your hardwareID and then this will be utilized to store data on the backend. If you do decide to login with your
apple ID, you will then be ablet o access your data across multiple platforms (iPhone, iPad..etc) To get started, you will need to input your first measurement
and/or your backlog of readings. As you input information, you will see the line graph forming, allowing you to trend information. You will also have a working
Hemoglobin A1c and EAG for evalution on the tab indicated as such. 


**_Code Examples_**

* Algorithms to determine HgA1c and EAG
```
var a1c: String {
        let numbers = measurements.measurements
        let count = numbers.count
        if count > 0{
            let averageGlucose = Double(total/count)
            let calculatedA1c =  (46.7 + averageGlucose) / 28.7
            return(String(format: "%.2f", calculatedA1c))
        }
        return "No information yet"
    }
    
    var estimatedAG: String {
        let numbers = measurements.measurements
        let count = numbers.count
        if count > 0 {
            let averageGlucose = Double(total / count)
            return (String(format: "%.2f", averageGlucose))
        }
        return "No information yet"
    }
```

* Form area utilizing a DatePicker and then a custom DateFormmatter

```
            Form{
                Section{
                    DatePicker("Select Date", selection: $todaysDate, displayedComponents: .date)

                    TextField("Please enter glucose reading", text: $reading)
                        .keyboardType(.numberPad)
                }
                Section{
                    Button("Submit Measurement"){
                        self.showAddedAlert.toggle()
                        let numReading = converToInt(reading: reading)
                        let formatter = DateFormatter()
                        formatter.dateFormat = "MM/dd/yyyy"

                        let formattedDate = formatter.string(from: todaysDate)
                        print(formattedDate)
                        let glucoseMeasruement = glucoseMeasurment(date: formattedDate, glucoseNumber: numReading)
                        measurements.addData(glucoseMeasruement)
                        self.date = ""
                        self.reading = ""
                    }
                }
                .disabled(reading.isEmpty) 
            }
```

**_To Do_**

1) Finish setup with Apple Authentication, as of now is non functional due to not having Apple Developer Acct. ETA < 1 month
2) Add swipe to delete functionality for readings. ETA < 2 weeks
3) Deploy to app store for testing. ETA ??


**Created By**

**Adam Nowland**
