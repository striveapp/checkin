import {Attendee, LessonDetails} from "./lessons";

export type HistoryAttendee = Attendee & {
    weekCounter: WeekCountersMap,
}


type WeekCounter = {
    counter: number | FirebaseFirestore.FieldValue
}

export type GlobalHistory = LessonDetails & {
    attendees: HistoryAttendeesMap,
    totalWeekCounters: WeekCountersMap
}

export type HistoryAttendeesMap = { [email: string]: HistoryAttendee; };
export type WeekCountersMap = { [timestamp: number]: WeekCounter; };

type HistoryLesson = LessonDetails & {
    timestamp: number
}

export type UserHistory = {
    attendedLessons: HistoryLesson[] | FirebaseFirestore.FieldValue
}