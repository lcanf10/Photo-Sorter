# Photo-Sorter

This PowerShell script sorts photos into folders based on the year and month of their last modification date. It's designed for those looking to organize their image files efficiently. The script scans a specified source directory for image files (jpg, jpeg, png, tif, tiff), and then moves them to a structured directory system in the format of Year\Month.
Prerequisites

    PowerShell 5.1 or newer
    Windows Operating System

How to Use

    Open PowerShell as an Administrator.
    Define the $sourceDirectory with the path to your unsorted photos.
    Define the $destinationDirectory where you want the sorted photos to go.
    Copy and paste the script into the PowerShell window and press Enter.

Script Breakdown

    Check Destination Directory: The script first checks if the destination directory exists. If not, it creates it.
    Find and Sort Photos: It searches for image files in the source directory and subdirectories. For each found image, it reads the last modified date, determines the year and month, and then moves the image to a corresponding directory in the destination path.
    Directory Structure: The destination directory will have folders named after years, and inside each year, there will be folders named after months.

Important Notes

    The script moves files, which means the photos will no longer exist in the original location after sorting.
    Ensure you have backups before running the script to prevent data loss.
    Modification dates of files can change for various reasons; this script uses the last modification date as a reference for sorting.

Customization

    To change the file types processed by the script, modify the extension filter in the Where-Object cmdlet.
    The script uses the system's culture settings to determine month names. This can be adjusted if necessary.

Running this script should streamline photo organization, especially for large collections. It provides a simple yet effective method of keeping your files ordered and easily accessible.
