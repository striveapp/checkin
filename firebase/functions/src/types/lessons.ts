type Attendee = {
  name: string
  imageUrl: string
  rank: string
  email: string
}

export type AcceptAllPayload = {
  lessonId: string,
  attendees: Attendee[],
}