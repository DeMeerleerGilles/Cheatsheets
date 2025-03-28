import requests
from bs4 import BeautifulSoup
import pandas as pd
import time

headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
    "Accept-Language": "en-US,en;q=0.9",
    "Referer": "https://www.google.com/"
}
    jobs = []
    
    for page in range(0, pages * 10, 10):  # Indeed paginates by 10 results per page
        params = {"q": search_query, "l": location, "start": page}
        response = requests.get(base_url, params=params, headers=headers)
        
        if response.status_code != 200:
            print("Failed to retrieve page", response.status_code)
            continue
        
        soup = BeautifulSoup(response.text, "html.parser")
        job_cards = soup.find_all("div", class_="job_seen_beacon")
        
        for job in job_cards:
            title_elem = job.find("h2", class_="jobTitle")
            company_elem = job.find("span", class_="companyName")
            location_elem = job.find("div", class_="companyLocation")
            job_link = job.find("a", class_="jcs-JobTitle")
            
            if title_elem and company_elem and location_elem and job_link:
                job_data = {
                    "Title": title_elem.text.strip(),
                    "Company": company_elem.text.strip(),
                    "Location": location_elem.text.strip(),
                    "Job URL": "https://be.indeed.com" + job_link["href"]
                }
                jobs.append(job_data)
        
        time.sleep(2)  # Avoid being blocked by Indeed
    
    return jobs

if __name__ == "__main__":
    search_query = "IT stage"
    location = "België"
    jobs = get_job_listings(search_query, location, pages=5)
    
    if jobs:
        df = pd.DataFrame(jobs)
        df.to_excel("IT_Internships_Indeed.xlsx", index=False)
        print("Scraping complete. Data saved to IT_Internships_Indeed.xlsx")
    else:
        print("No jobs found.")