type Attendee = {
  name: string
  imageUrl: string
  rank: string
  email: string
}

export type RegisterPayload = {
  lessonId: string,
  attendee: Attendee
}

export type ClearPayload = {
  lessonId: string,
}

export type UnregisterPayload = {
  lessonId: string,
  attendee: Attendee
}