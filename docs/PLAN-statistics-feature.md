# PLAN-statistics-feature

## Context

- **Goal**: Redesign the Statistics screen to focus on reading time analytics, visual consistency, and detailed insights.
- **Reference**: `lib/core/database/db_constants.dart` (Schema), `lib/ui/statistics` (Current UI).
- **User Preference**:
  - **Focus**: Reading Time (Daily).
  - **Visuals**: Activity Heatmap (GitHub-style), Weekly Bar Charts.
  - **Insights**: Most Read Genres, Reading Speed.
  - **Excluded**: Challenge Management (remove existing references).

## Architecture & Data Flow

### 1. Data Layer (`lib/data/repository/stats_repository.dart`)

- **New Queries**:
  - `getDailyReadingDuration(startDate, endDate)`: Aggregates `duration_ms` from `reading_sessions` grouped by day.
  - `getReadingDistributionByGenre()`: Joins `books` and `reading_sessions` (or uses `books` metadata directly) to calculate time/count per genre.
  - `calculateReadingSpeed()`: Average pages/hour or words/minute (requires `pages` from `books` and `duration_ms`).
- **Optimization**: Ensure efficient indexing on `start_time` in `reading_sessions`.

### 2. Logic Layer (`lib/logic/bloc/stats_bloc`)

- **State**: Update `StatsLoaded` to hold:
  - `Map<DateTime, int> dailyReadingMap`: For heatmap.
  - `List<WeeklyData> weeklyActivity`: For bar charts.
  - `List<GenreData> topGenres`: For breakdown.
  - `double averageReadingSpeed`: Calculated metric.
  - `Duration totalReadingTime`: Summary metric.
- **Events**: Refine `StatsLoad` to trigger these specific calculations.
- **Cleanup**: Remove `ChallengeBloc` dependencies/listeners from the Statistics feature.

### 3. UI Layer (`lib/ui/statistics`)

- **Dependencies**: Add `fl_chart` (charts) and `flutter_heatmap_calendar` (heatmap).
- **Widgets**:
  - `ReadingHeatmap`: GitHub-style contribution graph showing reading intensity over the last year.
  - `WeeklyActivityChart`: Bar chart showing reading hours for the current week.
  - `GenreBreakdown`: List or Pie Chart of top genres.
  - `SummaryGrid`: Cards for Total Time, Streak, Average Speed.
- **Cleanup**: Remove "Challenge" setting widgets.

## Task Breakdown

### Phase 1: Logic & Data (Backend)

- [ ] **Analyze Queries**: Verify `reading_sessions` queries.
- [ ] **Repo Update**: Create/Update methods in repository to fetch daily duration and genre stats.
- [ ] **Bloc Logic**: Update `StatsBloc` to process raw data into UI-ready models (Heatmap datasets, Chart spots).
- [ ] **Clean Code**: Remove "Challenge" related code from existing `StatisticsScreen`.

### Phase 2: UI Implementation (Frontend)

- [ ] **Dependencies**: Add `flutter_heatmap_calendar` (or build custom) and `fl_chart`.
- [ ] **Heatmap Widget**: Implement the "Reading Consistency" view.
- [ ] **Weekly Chart**: Implement the "Activity" bar chart.
- [ ] **Stat Cards**: Create aesthetic cards for "Reading Speed", "Total Time".
- [ ] **Genre List**: Implement the "Most Read Genres" section.

### Phase 3: Verification

- [ ] **Manual Test**: Verify heatmap updates after a reading session.
- [ ] **Calculations**: Check "Reading Speed" math against known dummy data.
- [ ] **Performance**: Ensure chart rendering doesn't drop frames on load.

## Agent Assignments

- **Logic**: `backend-specialist` (Data aggregation)
- **UI**: `frontend-specialist` (Charts & Visuals)
