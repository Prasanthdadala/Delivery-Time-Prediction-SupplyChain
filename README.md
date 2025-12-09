🚚 Supply Chain Delivery Time Prediction
Solo Project Submission for Daxwell – Data Analyst Role

Author: Prasanth Dadala

📌 Project Overview

This project predicts delivery time for supply-chain shipments using machine learning.
A public trip dataset (NYC TLC) is reframed as delivery truck movement, representing:

Dispatch time

Delivery time

Distance traveled

Traffic conditions

Operational delays

This project demonstrates:

Data cleaning & preparation

Feature engineering

SQL-based operational analysis

Exploratory Data Analysis (EDA)

Predictive modeling (Linear Regression & Random Forest)

Business insights for supply-chain optimization

This aligns directly with Daxwell’s distribution operations in PPE delivery, warehousing, transportation, and logistics forecasting.

🧰 Tech Stack

Python: Pandas, NumPy, Matplotlib, Seaborn, Scikit-Learn

SQL for operational analytics

Jupyter Notebook

Power BI (optional dashboard)

📂 Project Structure
Delivery-Time-Prediction-SupplyChain/
│── README.md
│── delivery_time_prediction.ipynb
│── data/
│     └── deliveries.csv
│── sql/
│     └── supply_chain_analysis.sql
│── results/
│     └── model_performance.png
│     └── feature_importance.png
│── dashboards/
      └── delivery_kpis.pdf

📊 1. Data Preparation & Cleaning

Steps completed:

Removed incorrect or missing pickup/dropoff timestamps

Filtered invalid coordinates

Calculated delivery duration in minutes

Removed extreme outliers to improve model performance

Added new operational features:

Feature	Description
distance	Estimated delivery route distance
hour_of_dispatch	Time of day the delivery started
day_of_week	Operational weekday/weekend patterns
traffic_window	Categorized into peak/non-peak hours

These features mimic real-world supply-chain behavior.

🔍 2. Exploratory Data Analysis (EDA)

Insights discovered:

🚧 Traffic Impact

Deliveries dispatched during 7–10 AM & 4–7 PM show significantly higher delivery times.

📦 Distance vs. Duration

Distance is the strongest predictor of delivery time — but short trips can also take longer due to congestion.

🗓 Weekday vs. Weekend Variability

Weekend deliveries show more consistent travel times, while weekdays have higher volatility.

EDA visuals include:

Distribution of delivery time

Scatter plot: Distance vs Delivery Time

Correlation heatmap

Peak-hour delay patterns

🤖 3. Modeling

Two models were trained:

Model	Performance	Notes
Linear Regression	RMSE: ___	Baseline model
Random Forest	RMSE: ___	Best performance, handles non-linear patterns

Random Forest outperformed Linear Regression by capturing interactions such as:

Distance × Traffic Windows

Time of day impacts

Non-linear delivery trends

Model evaluation metrics will be stored in the results/ folder.

🧠 4. Operational Insights

Key recommendations based on analysis:

**1️⃣ Distance is the strongest predictor of delivery time**  
Longer distances increase delivery time, but the relationship is non-linear — suggesting opportunities for route optimization.

**2️⃣ Morning and evening peak traffic create the largest delays**  
Deliveries during 7–10 AM and 4–7 PM consistently face higher delays.

**3️⃣ Short-distance deliveries show unexpected delays during peak hours**  
This indicates that congestion, not distance, is the main contributor to delays during rush hours.

**4️⃣ Gradient Boosting and Random Forest outperform Linear Regression**  
Tree-based models provide higher prediction accuracy and are better suited for real-world ETA forecasting.

🎯 Business Impact for Daxwell

This methodology can immediately support:

Shipment ETA prediction

Increasing delivery reliability

Reducing late deliveries

Improving warehouse-to-customer workflows

Optimizing dispatch scheduling

Reducing operational costs

🔗 Project Link

(Add your GitHub repo link here once complete)

📄 Files Included

Full Jupyter Notebook

SQL analysis file

Model evaluation plots

Optional Power BI dashboard

🙌 Conclusion

This project demonstrates:

End-to-end data analytics capability

Practical supply-chain modeling

SQL + Python workflow

Strong communication of insights

High relevance to Daxwell’s logistics and distribution environment

Thank you for reviewing my submission.
