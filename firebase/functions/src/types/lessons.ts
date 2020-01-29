export type Attendee = {
  name: string
  imageUrl: string
  rank: string
  email: string
}

type Master = {
  name: string
  imageUrl: string
  email: string
}

export type LessonDetails = {
  id: string,
  name: string,
  timeStart: string,
  timeEnd: string,
  weekDay: string,
  masters: Master[]
}

export type Lesson = LessonDetails & {
  attendees: Attendee[]
}

export type AcceptAllPayload = {
  lesson: Lesson
}