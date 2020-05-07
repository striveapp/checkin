import {Attendee, LessonDetails} from "./lessons";

export type HistoryAttendee = Attendee & {
    weekCounter: WeekCountersMap,
}

type WeekCounter = {
    counter: number | FirebaseFirestore.FieldValue
}

export type WeekCountersMap = { [timestamp: number]: WeekCounter; };

type HistoryLesson = LessonDetails & {
    timestamp: number
}

export type UserHistory = {
    attendedLessons: HistoryLesson[] | FirebaseFirestore.FieldValue
}